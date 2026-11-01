#!/usr/bin/env python3
"""Opt-in signed updater integration check; uses isolated fixture apps, not installed Cirno."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import plistlib
import shutil
import signal
import subprocess
import time

MAIN = r'''
import AppKit
import Foundation
let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let bundle = Bundle.main
let configPath = bundle.object(forInfoDictionaryKey: "RefugeFixtureConfig") as! String
let config = try JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: configPath))) as! [String: Any]
let root = URL(fileURLWithPath: config["root"] as! String)
let build = Int(bundle.object(forInfoDictionaryKey: "CFBundleVersion") as! String)!
if build == 102 && config["failLaunch"] as? Bool == true { exit(71) }
try MacUpdate.json(["build": build, "pid": ProcessInfo.processInfo.processIdentifier], to: root.appendingPathComponent("started-" + String(build) + ".json"))
if build == 101 && !FileManager.default.fileExists(atPath: root.appendingPathComponent("committed").path) {
  DispatchQueue.global().async {
    do {
      let zip = URL(fileURLWithPath: config["zip"] as! String)
      let request = try MacUpdate.prepare(zip: zip,
        asset: MacUpdateAsset(version: "1.1.0", buildNumber: 102, size: config["size"] as! Int, sha256: config["sha256"] as! String),
        install: bundle.bundleURL, validateArchive: { _ in })
      try MacUpdate.json(["transaction": request.transactionPath], to: root.appendingPathComponent("prepared.json"))
      try Data().write(to: root.appendingPathComponent("committed"))
      try Data().write(to: URL(fileURLWithPath: request.transactionPath).appendingPathComponent("commit"))
      DispatchQueue.main.async { app.terminate(nil) }
    } catch {
      try? MacUpdate.json(["error": error.localizedDescription], to: root.appendingPathComponent("failure.json"))
      DispatchQueue.main.async { app.terminate(nil) }
    }
  }
}
let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 360, height: 160),
  styleMask: [.titled, .closable], backing: .buffered, defer: false)
window.title = "Refuge updater isolated test"
window.makeKeyAndOrderFront(nil)
DispatchQueue.main.async {
  if build == 102 && config["noFrame"] as? Bool == true { return }
  if let arg = ProcessInfo.processInfo.arguments.first(where: { $0.hasPrefix("--refuge-update-ready=") }) {
    let marker = URL(fileURLWithPath: String(arg.dropFirst("--refuge-update-ready=".count)))
    try? MacUpdate.json(["pid": getpid()], to: marker)
  }
}
app.run()
'''

def run(*args):
    subprocess.run(args, check=True, stdout=subprocess.DEVNULL)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, required=True)
    parser.add_argument('--signed-app', type=Path, required=True)
    parser.add_argument('--job', type=Path, required=True)
    args = parser.parse_args()
    args.job.mkdir(parents=True, mode=0o700, exist_ok=False)
    identity = os.environ['REFUGE_CODE_SIGN_IDENTITY']
    source = args.job / 'main.swift'; source.write_text(MAIN)
    binary = args.job / 'fixture'
    run('/usr/bin/xcrun', 'swiftc', '-O', '-target', 'arm64-apple-macos12.0',
        str(args.repo / 'macos/Packages/RefugeAppUpdate/Sources/RefugeAppUpdate/MacUpdate.swift'), str(source), '-o', str(binary))
    intel = args.job / 'fixture-intel'
    run('/usr/bin/xcrun', 'swiftc', '-O', '-target', 'x86_64-apple-macos12.0',
        str(args.repo / 'macos/Packages/RefugeAppUpdate/Sources/RefugeAppUpdate/MacUpdate.swift'), str(source), '-o', str(intel))
    support = Path.home() / 'Library/Application Support/vip.kirakira.Refuge-ios/updates/macos'
    pointer = support / 'last-transaction.json'
    previous = pointer.read_bytes() if pointer.exists() else None
    results = []
    try:
        for mode in ['success', 'rollback', 'no-frame', 'wrong-signature', 'wrong-architecture', 'read-only']:
            fail = mode != 'success'
            rejected = mode in ['wrong-signature', 'wrong-architecture', 'read-only']
            root = args.job / mode; root.mkdir()
            install_parent = root / 'installed'; install_parent.mkdir()
            installed = install_parent / '星河避难所.app'; staged = root / 'package/星河避难所.app'
            for app, build in [(installed, 101), (staged, 102)]:
                contents = app / 'Contents'
                (contents / 'MacOS').mkdir(parents=True)
                (contents / 'Helpers').mkdir()
                (contents / 'Resources').mkdir()
                (contents / 'Resources/refuge-release.json').write_text('{}')
                shutil.copy2(intel if mode == 'wrong-architecture' and build == 102 else binary, contents / 'MacOS/星河避难所')
                shutil.copy2(args.signed_app / 'Contents/Helpers/refuge_updater', contents / 'Helpers/refuge_updater')
                info = dict(CFBundleIdentifier='vip.kirakira.Refuge-ios', CFBundleName='星河避难所', CFBundleExecutable='星河避难所',
                            CFBundlePackageType='APPL', CFBundleShortVersionString='1.1.0', CFBundleVersion=str(build), LSUIElement=True,
                            RefugeFixtureConfig=str(root / 'config.json'))
                (contents / 'Info.plist').write_bytes(plistlib.dumps(info))
                run('/usr/bin/codesign', '--force', '--timestamp', '--sign', identity, str(app))
                run('/usr/bin/codesign', '--verify', '--deep', '--strict', str(app))
            if mode == 'wrong-signature': run('/usr/bin/codesign', '--force', '--sign', '-', str(staged))
            archive = root / 'update.zip'
            run('/usr/bin/ditto', '-c', '-k', '--keepParent', str(staged), str(archive))
            data = archive.read_bytes()
            (root / 'config.json').write_text(json.dumps(dict(root=str(root), zip=str(archive), size=len(data), sha256=hashlib.sha256(data).hexdigest(), failLaunch=mode == 'rollback', noFrame=mode == 'no-frame')))
            marker = root / 'user.sqlite'; marker.write_bytes(b'unchanged user data')
            if mode == 'read-only': install_parent.chmod(0o555)
            run('/usr/bin/open', '-n', str(installed))
            deadline = time.monotonic() + 150
            result = None
            while time.monotonic() < deadline:
                if (root / 'failure.json').exists():
                    if not rejected: raise RuntimeError((root / 'failure.json').read_text())
                    result = dict(state='rejected', message=json.loads((root / 'failure.json').read_text())['error']); break
                if (root / 'prepared.json').exists():
                    transaction = Path(json.loads((root / 'prepared.json').read_text())['transaction'])
                    if (transaction / 'result.json').exists():
                        result = json.loads((transaction / 'result.json').read_text())
                        if result['state'] in ['succeeded', 'failed']: break
                time.sleep(.2)
            if result is None: raise RuntimeError('updater did not finish')
            install_parent.chmod(0o755)
            expected = 'rejected' if rejected else 'failed' if fail else 'succeeded'
            assert result['state'] == expected, result
            info = plistlib.loads((installed / 'Contents/Info.plist').read_bytes())
            assert info['CFBundleVersion'] == ('101' if fail else '102'), info
            assert marker.read_bytes() == b'unchanged user data'
            if fail:
                assert '恢复失败' not in result.get('message', ''), result
                assert '手动恢复' not in result.get('message', ''), result
            if mode == 'no-frame':
                new_pid = json.loads((root/'started-102.json').read_text())['pid']
                status = subprocess.run(['/bin/ps','-p',str(new_pid),'-o','comm='],capture_output=True,text=True).stdout.strip()
                assert not status or Path(status).resolve() != (installed/'Contents/MacOS/星河避难所').resolve(), 'Failed new child still running'
            for file in root.glob('started-*.json'):
                pid = json.loads(file.read_text())['pid']
                cmd = subprocess.run(['/bin/ps', '-p', str(pid), '-o', 'comm='], capture_output=True, text=True).stdout.strip()
                if cmd and Path(cmd).resolve() == (installed / 'Contents/MacOS/星河避难所').resolve():
                    os.kill(pid, signal.SIGTERM)
            results.append(dict(case=mode, result=result))
            (args.job / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2))
        (args.job / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2))
        print(json.dumps(dict(passed=True, cases=len(results)), ensure_ascii=False))
    finally:
        for parent in args.job.glob('*/installed'):
            parent.chmod(0o755)
        for marker in args.job.glob('*/started-*.json'):
            pid = json.loads(marker.read_text())['pid']
            cmd = subprocess.run(['/bin/ps','-p',str(pid),'-o','comm='],capture_output=True,text=True).stdout.strip()
            expected = marker.parent/'installed/星河避难所.app/Contents/MacOS/星河避难所'
            if cmd and Path(cmd).resolve() == expected.resolve():
                try: os.kill(pid,signal.SIGTERM)
                except ProcessLookupError: pass
        if previous is None: pointer.unlink(missing_ok=True)
        else: pointer.write_bytes(previous)

if __name__ == '__main__': main()
