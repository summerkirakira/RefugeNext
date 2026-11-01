import Cocoa
import FlutterMacOS

final class AppUpdateBridge {
  private let channel: FlutterMethodChannel
  private let queue = DispatchQueue(label: "refuge.appUpdate")
  private var pending: MacUpdateRequest?
  private var preparing = false

  init(messenger: FlutterBinaryMessenger) {
    channel = FlutterMethodChannel(name: "vip.kirakira.refuge_next/app_update", binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in self?.handle(call, result) }
  }

  private func handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    switch call.method {
    case "directory": result(MacUpdate.support.path)
    case "supportsMacOSUpdate":
      result(MacUpdate.supportsARM64 && Bundle.main.object(forInfoDictionaryKey: "RefugeStandalone") as? Bool == true)
    case "prepareStorage":
      do {
        if Bundle.main.object(forInfoDictionaryKey: "RefugeStandalone") as? Bool == true {
          try LegacyDataMigration.run()
        }
        result(nil)
      } catch { failure(error, result) }
    case "startupReady":
      do {
        if let arg = ProcessInfo.processInfo.arguments.first(where: { $0.hasPrefix("--refuge-update-ready=") }) {
          let marker = URL(fileURLWithPath: String(arg.dropFirst("--refuge-update-ready=".count)))
          let transactions = MacUpdate.support.appendingPathComponent("transactions").path + "/"
          guard marker.resolvingSymlinksInPath().path == marker.path,
                marker.path.hasPrefix(transactions), marker.lastPathComponent.hasPrefix("startup-") else {
            throw MacUpdateError.invalid("启动确认路径无效")
          }
          try MacUpdate.json(["pid": getpid()], to: marker)
        }
        result(nil)
      } catch { failure(error, result) }
    case "prepareMacOSUpdate":
      guard !preparing, pending == nil, let args = call.arguments as? [String: Any],
            let path = args["zipPath"] as? String, let size = args["size"] as? Int,
            let hash = args["sha256"] as? String, let version = args["version"] as? String,
            let build = args["buildNumber"] as? Int, let entries = args["entries"] as? [[String: Any]] else {
        result(FlutterError(code: "invalid_update", message: "更新参数无效或正在更新", details: nil)); return
      }
      preparing = true
      let install = Bundle.main.bundleURL
      queue.async {
        do {
          let archiveEntries = try entries.map { entry -> MacArchiveEntry in
            guard let name = entry["path"] as? String, let size = entry["size"] as? Int, size >= 0 else {
              throw MacUpdateError.invalid("归档项目无效")
            }
            return MacArchiveEntry(path: name, size: UInt64(size), link: entry["link"] as? String)
          }
          let request = try MacUpdate.prepare(zip: URL(fileURLWithPath: path),
            asset: MacUpdateAsset(version: version, buildNumber: build, size: size, sha256: hash),
            install: install, validateArchive: { _ in try MacArchivePolicy.validate(archiveEntries) })
          DispatchQueue.main.async {
            self.preparing = false; self.pending = request
            result(["transactionPath": request.transactionPath])
          }
        } catch {
          DispatchQueue.main.async { self.preparing = false; self.failure(error, result) }
        }
      }
    case "commitMacOSUpdate", "cancelMacOSUpdate":
      guard let args = call.arguments as? [String: Any], let path = args["transactionPath"] as? String,
            let request = pending, path == request.transactionPath else {
        result(FlutterError(code: "invalid_transaction", message: "更新事务不存在", details: nil)); return
      }
      do {
        try MacUpdate.validateRequest(request)
        let directory = URL(fileURLWithPath: path)
        if call.method == "cancelMacOSUpdate" {
          try Data("cancel".utf8).write(to: directory.appendingPathComponent("cancel"), options: [.atomic])
          pending = nil; result(nil)
        } else {
          guard !FileManager.default.fileExists(atPath: directory.appendingPathComponent("result.json").path) else {
            throw MacUpdateError.invalid("更新器已停止，请重试")
          }
          try Data("commit".utf8).write(to: directory.appendingPathComponent("commit"), options: [.atomic])
          result(nil)
          DispatchQueue.main.async { NSApp.terminate(nil) }
        }
      } catch { failure(error, result) }
    default: result(FlutterMethodNotImplemented)
    }
  }
  private func failure(_ error: Error, _ result: FlutterResult) {
    result(FlutterError(code: "update_failed", message: error.localizedDescription, details: nil))
  }
}
