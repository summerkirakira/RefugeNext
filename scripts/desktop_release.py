#!/usr/bin/env python3
"""Validate a desktop bundle, prepare its manifest, optionally publish via SSH.
No credentials are stored in this script. Publishing never changes Android config.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import plistlib
import posixpath
import re
import shlex
import stat
import struct
import subprocess
import sys
import tempfile
import zipfile

BASE = 'https://image.biaoju.site/starcitizen/app'

def digest(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''): h.update(chunk)
    return h.hexdigest()

def pe_version(data):
    if data[:2] != b'MZ' or len(data) < 64: raise ValueError('Missing Windows executable')
    offset = struct.unpack_from('<I', data, 60)[0]
    if data[offset:offset+6] != b'PE\0\0\x64\x86': raise ValueError('Expected x64 executable')
    key = 'ProductVersion\0'.encode('utf-16le')
    start = data.find(key)
    if start < 0: raise ValueError('Missing ProductVersion')
    start = (start + len(key) + 3) & ~3
    end = start
    while end + 1 < len(data) and data[end:end+2] != b'\0\0': end += 2
    return data[start:end].decode('utf-16le')

def inspect_bundle(path, platform):
    architecture = 'x64' if platform == 'windows' else 'arm64'
    with zipfile.ZipFile(path) as z:
        entries = z.infolist()
        if len(entries) > 20000 or sum(e.file_size for e in entries) > 1024**3:
            raise ValueError('Archive too large')
        names, folded, links, by_name = set(), set(), {}, {}
        root = '星河避难所.app'
        for entry in entries:
            name = (entry.filename.replace('\\', '/') if platform == 'windows' else entry.filename).rstrip('/')
            parts = name.split('/')
            if not name or '\\' in name or any(p in ('', '.', '..') for p in parts) or name.casefold() in folded:
                raise ValueError('Unsafe/duplicate archive path')
            if platform == 'macos' and parts[0] != root: raise ValueError('Unexpected App root')
            names.add(name); folded.add(name.casefold()); by_name[name] = entry
            if stat.S_ISLNK(entry.external_attr >> 16):
                if platform == 'windows' or entry.file_size > 4096: raise ValueError('Invalid link')
                target = z.read(entry).decode('utf-8')
                resolved = posixpath.normpath(posixpath.join(posixpath.dirname(name), target))
                if target.startswith('/') or not resolved.startswith(root+'/'): raise ValueError('Escaping link')
                links[name] = resolved
        for name in names:
            if any('/'.join(name.split('/')[:i]) in links for i in range(1, len(name.split('/')))):
                raise ValueError('Archive entry beneath symlink')
        for name in links:
            seen, current = set(), name
            for _ in range(64):
                parts = current.split('/')
                ancestors = ['/'.join(parts[:i]) for i in range(1, len(parts)+1)]
                linked = next((a for a in ancestors if a in links), None)
                if linked is None: break
                if linked in seen: raise ValueError('Cyclic link')
                seen.add(linked); current = links[linked] + current[len(linked):]
            else: raise ValueError('Link depth exceeded')
            if current not in names: raise ValueError('Broken link')
        prefix = root+'/Contents/Resources/' if platform == 'macos' else ''
        meta_entry = by_name[prefix+'refuge-release.json']
        if meta_entry.file_size > 4096 or meta_entry.filename in links: raise ValueError('Invalid metadata')
        meta = json.loads(z.read(meta_entry))
        if meta.get('product') != 'refuge_next' or meta.get('platform') != platform or meta.get('architecture') != architecture:
            raise ValueError('Wrong release identity')
        if not re.fullmatch(r'\d+\.\d+\.\d+', meta['version']) or type(meta['buildNumber']) is not int or meta['buildNumber'] < 1:
            raise ValueError('Invalid release version')
        if platform == 'windows':
            for name in ['refuge_next.exe', 'refuge_updater.exe', 'flutter_windows.dll', 'sqlite3.dll', 'data/icudtl.dat', 'data/app.so']:
                if name not in names: raise ValueError('Missing '+name)
            if pe_version(z.read(by_name['refuge_next.exe'])) != f"{meta['version']}+{meta['buildNumber']}":
                raise ValueError('Actual executable version differs from manifest')
        else:
            info = plistlib.loads(z.read(root+'/Contents/Info.plist'))
            if info['CFBundleIdentifier'] != 'vip.kirakira.Refuge-ios' or info['CFBundleShortVersionString'] != meta['version'] or int(info['CFBundleVersion']) != meta['buildNumber'] or info.get('RefugeStandalone') is not True:
                raise ValueError('Actual App identity differs from manifest')
            for name in ['Contents/Helpers/refuge_updater', 'Contents/_CodeSignature/CodeResources']:
                if root+'/'+name not in names: raise ValueError('Missing '+name)
            if sys.platform != 'darwin': raise ValueError('Validate/sign the Mac release on macOS')
            with tempfile.TemporaryDirectory(prefix='refuge-release-check-') as temp:
                subprocess.run(['ditto', '-x', '-k', str(path), temp], check=True)
                app = Path(temp)/root
                subprocess.run(['codesign', '--verify', '--deep', '--strict', str(app)], check=True)
                identity = subprocess.run(['codesign','-d','--verbose=4',str(app)],text=True,capture_output=True,check=True).stderr
                if 'Authority=Developer ID Application:' not in identity: raise ValueError('Expected Developer ID signature')
                for binary in [app/'Contents/MacOS/星河避难所', app/'Contents/Helpers/refuge_updater']:
                    if subprocess.check_output(['lipo','-archs',str(binary)],text=True).strip() != 'arm64': raise ValueError('Expected ARM64')
    return meta

# Sent over stdin to the existing SSH account. It validates and stages first;
# immutable public bytes are checked before latest.json is atomically switched.
REMOTE = r'''
import fcntl,hashlib,json,os,pathlib,sys,urllib.request
request=json.load(sys.stdin); manifest=request['manifest']; root=pathlib.Path(request['root'])
folder=root/manifest['platform']/manifest['architecture']; folder.mkdir(parents=True,exist_ok=True)
def hashfile(path):
 h=hashlib.sha256()
 with open(path,'rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
staged=pathlib.Path(request['staged']); name=request['name']; asset=folder/name
assert staged.stat().st_size==manifest['size'] and hashfile(staged)==manifest['sha256']
with (folder/'.publish.lock').open('a') as lock:
 fcntl.flock(lock,fcntl.LOCK_EX)
 latest=folder/'latest.json'
 if latest.exists():
  old=json.loads(latest.read_text())
  def version(m):return (*map(int,m['name'].split('.')),m['code'])
  assert version(manifest)>version(old) or old==manifest, 'Refusing non-increasing release'
 if asset.exists():assert hashfile(asset)==manifest['sha256'], 'Immutable asset differs'
 else:
  # Stage on the destination filesystem and publish without replacing a name.
  import shutil,tempfile
  fd,tmp=tempfile.mkstemp(prefix='.upload-',dir=folder);os.close(fd)
  try:
   shutil.copyfile(staged,tmp);os.chmod(tmp,0o644);os.link(tmp,asset)
  finally:os.unlink(tmp)
 h=hashlib.sha256();size=0
 with urllib.request.urlopen(manifest['url'],timeout=60) as response:
  while True:
   b=response.read(1048576)
   if not b:break
   h.update(b);size+=len(b)
 assert size==manifest['size'] and h.hexdigest()==manifest['sha256'], 'Public download mismatch'
 if latest.exists():
  (folder/'previous.json').write_bytes(latest.read_bytes())
 temp=folder/'.latest.json.tmp'
 with temp.open('w') as f:json.dump(manifest,f,ensure_ascii=False,indent=2);f.flush();os.fsync(f.fileno())
 os.chmod(temp,0o644);os.replace(temp,latest)
 staged.unlink()
 print(json.dumps({'published':True,'url':manifest['url'],'sha256':manifest['sha256']}))
'''

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('artifact', type=Path)
    parser.add_argument('--platform', choices=['windows','macos'], required=True)
    parser.add_argument('--notes-file', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--publish', action='store_true')
    parser.add_argument('--ssh-host', default='ubuntu@biaoju.site')
    parser.add_argument('--remote-root', default='/var/www/html/starcitizen/app')
    args = parser.parse_args()
    meta = inspect_bundle(args.artifact, args.platform)
    name = f"refuge-{meta['version']}-{meta['buildNumber']}-{args.platform}-{meta['architecture']}.zip"
    manifest = dict(schemaVersion=1,platform=args.platform,architecture=meta['architecture'],
        name=meta['version'],code=meta['buildNumber'],notes=args.notes_file.read_text(),
        url=f"{BASE}/{args.platform}/{meta['architecture']}/{name}",size=args.artifact.stat().st_size,sha256=digest(args.artifact))
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
    if args.publish:
        import uuid
        staged='/tmp/refuge-desktop-'+uuid.uuid4().hex+'.zip'
        subprocess.run(['scp',str(args.artifact),args.ssh_host+':'+staged],check=True)
        subprocess.run(['ssh',args.ssh_host,'python3 -c '+shlex.quote(REMOTE)],input=json.dumps(dict(manifest=manifest,root=args.remote_root,staged=staged,name=name)),text=True,check=True)
    print(json.dumps(manifest,ensure_ascii=False,indent=2))

if __name__ == '__main__': main()
