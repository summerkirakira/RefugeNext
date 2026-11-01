import AppKit
import CryptoKit
import Darwin
import Foundation
import Security

public enum MacUpdateError: LocalizedError {
  case invalid(String)
  public var errorDescription: String? {
    switch self { case .invalid(let message): return message }
  }
}

public struct MacUpdateAsset {
  public let version: String
  public let buildNumber: Int
  public let size: Int
  public let sha256: String
  public init(version: String, buildNumber: Int, size: Int, sha256: String) {
    self.version = version; self.buildNumber = buildNumber
    self.size = size; self.sha256 = sha256
  }
}

public struct MacArchiveEntry {
  public let path: String
  public let size: UInt64
  public let link: String?
  public init(path: String, size: UInt64, link: String? = nil) {
    self.path = path; self.size = size; self.link = link
  }
}

public enum MacArchivePolicy {
  public static func validate(_ entries: [MacArchiveEntry]) throws {
    let root = "星河避难所.app"
    guard entries.count <= 20000 else { throw MacUpdateError.invalid("更新包文件过多") }
    var names = Set<String>(), foldedNames = Set<String>(), links = [String: String](), expanded: UInt64 = 0
    for entry in entries {
      let name = entry.path.hasSuffix("/") ? String(entry.path.dropLast()) : entry.path
      let parts = name.components(separatedBy: "/")
      guard entry.size <= 1024 * 1024 * 1024 - expanded else {
        throw MacUpdateError.invalid("更新包展开大小超过限制")
      }
      expanded += entry.size
      guard expanded <= 1024 * 1024 * 1024,
            !parts.contains(where: { $0.isEmpty || $0 == "." || $0 == ".." }),
            parts.first == root || parts.first == "__MACOSX",
            !name.contains("\\"),
            !name.unicodeScalars.contains(where: { $0.value < 32 }),
            names.insert(name).inserted,
            foldedNames.insert(name.precomposedStringWithCanonicalMapping.lowercased()).inserted else {
        throw MacUpdateError.invalid("更新包包含不安全的路径或超过大小限制")
      }
      if let target = entry.link {
        let resolved = ((("/" + name) as NSString).deletingLastPathComponent + "/" + target as NSString).standardizingPath
        guard !target.isEmpty, !target.hasPrefix("/"), !target.contains("\\"),
              !target.unicodeScalars.contains(where: { $0.value < 32 }),
              resolved.hasPrefix("/" + root + "/") else {
          throw MacUpdateError.invalid("更新包包含越界符号链接")
        }
        links[name] = String(resolved.dropFirst())
      }
    }
    for name in names {
      var parent = (name as NSString).deletingLastPathComponent
      while !parent.isEmpty {
        guard links[parent] == nil else { throw MacUpdateError.invalid("更新包通过符号链接写入文件") }
        parent = (parent as NSString).deletingLastPathComponent
      }
    }
    for (name, first) in links {
      var current = first, seen = Set([name])
      for step in 0..<64 {
        let parts = current.components(separatedBy: "/")
        var replaced = false
        for i in 1...parts.count {
          let ancestor = parts.prefix(i).joined(separator: "/")
          guard let target = links[ancestor] else { continue }
          guard seen.insert(ancestor).inserted else { throw MacUpdateError.invalid("更新包包含循环链接") }
          current = ([target] + Array(parts.dropFirst(i))).joined(separator: "/")
          replaced = true; break
        }
        if !replaced { break }
        guard step < 63 else { throw MacUpdateError.invalid("更新包链接层级过多") }
      }
      guard names.contains(current) else { throw MacUpdateError.invalid("更新包包含失效链接") }
    }
    for suffix in ["Contents/Info.plist", "Contents/MacOS/星河避难所",
                   "Contents/Helpers/refuge_updater", "Contents/Resources/refuge-release.json",
                   "Contents/_CodeSignature/CodeResources"] {
      let name = root + "/" + suffix
      guard names.contains(name), links[name] == nil else { throw MacUpdateError.invalid("更新包缺少 " + suffix) }
    }
  }
}

public struct MacUpdateRequest: Codable {
  public let schemaVersion: Int
  public let id: String
  public let parentPid: Int32
  public let parentExecutable: String
  public let parentLaunchTime: Double
  public let installPath: String
  public let stagedPath: String
  public let transactionPath: String
  public let zipPath: String
  public let version: String
  public let buildNumber: Int
  public let zipSize: Int
  public let zipSha256: String
}

public enum MacUpdate {
  public static let bundleID = "vip.kirakira.Refuge-ios"
  public static var support: URL {
    FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
      .appendingPathComponent(bundleID).appendingPathComponent("updates/macos")
  }
  public static var supportsARM64: Bool {
    var value: Int32 = 0, size = MemoryLayout<Int32>.size
    return sysctlbyname("hw.optional.arm64", &value, &size, nil, 0) == 0 && value == 1
  }
  public static func hash(_ url: URL) throws -> String {
    let file = try FileHandle(forReadingFrom: url)
    defer { try? file.close() }
    var digest = SHA256()
    while let data = try file.read(upToCount: 1024 * 1024), !data.isEmpty { digest.update(data: data) }
    return digest.finalize().map { String(format: "%02x", $0) }.joined()
  }
  public static func checkZIP(_ url: URL, size: Int, sha256: String) throws {
    let info = try FileManager.default.attributesOfItem(atPath: url.path)
    guard info[.type] as? FileAttributeType == .typeRegular,
          (info[.size] as? NSNumber)?.intValue == size, size > 0,
          sha256.count == 64, try hash(url) == sha256 else {
      throw MacUpdateError.invalid("更新包大小或 SHA-256 校验失败，请重新下载")
    }
  }
  @discardableResult
  public static func tool(_ path: String, _ arguments: [String], timeout: TimeInterval = 120) throws -> String {
    let output = FileManager.default.temporaryDirectory.appendingPathComponent("refuge-tool-" + UUID().uuidString)
    _ = FileManager.default.createFile(atPath: output.path, contents: nil, attributes: [.posixPermissions: 0o600])
    defer { try? FileManager.default.removeItem(at: output) }
    let handle = try FileHandle(forWritingTo: output)
    defer { try? handle.close() }
    let process = Process()
    process.executableURL = URL(fileURLWithPath: path); process.arguments = arguments
    process.standardInput = FileHandle.nullDevice
    process.standardOutput = handle; process.standardError = handle
    try process.run()
    let deadline = Date().addingTimeInterval(timeout)
    while process.isRunning && Date() < deadline { Thread.sleep(forTimeInterval: 0.1) }
    if process.isRunning { kill(process.processIdentifier, SIGKILL) }
    process.waitUntilExit()
    let reader = try FileHandle(forReadingFrom: output)
    defer { try? reader.close() }
    let text = String(data: try reader.read(upToCount: 65536) ?? Data(), encoding: .utf8) ?? ""
    guard process.terminationStatus == 0 else {
      throw MacUpdateError.invalid("更新校验或安装工具执行失败：" + text.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    return text
  }
  public static func requirement(_ app: URL) throws -> String {
    var code: SecStaticCode?
    guard SecStaticCodeCreateWithPath(app as CFURL, [], &code) == errSecSuccess, let code else {
      throw MacUpdateError.invalid("无法读取当前应用签名")
    }
    var information: CFDictionary?
    guard SecCodeCopySigningInformation(code, SecCSFlags(rawValue: kSecCSSigningInformation), &information) == errSecSuccess,
          let info = information as? [String: Any],
          info[kSecCodeInfoIdentifier as String] as? String == bundleID,
          let team = info[kSecCodeInfoTeamIdentifier as String] as? String, !team.isEmpty else {
      throw MacUpdateError.invalid("当前应用需要先安装一次 Developer ID 签名版")
    }
    var requirement: SecRequirement?, text: CFString?
    guard SecCodeCopyDesignatedRequirement(code, [], &requirement) == errSecSuccess, let requirement,
          SecRequirementCopyString(requirement, [], &text) == errSecSuccess, let text else {
      throw MacUpdateError.invalid("无法读取应用签名身份")
    }
    return text as String
  }
  public static func validateBundle(_ app: URL, asset: MacUpdateAsset, requirement: String) throws {
    try tool("/usr/bin/codesign", ["--verify", "--deep", "--strict", "--all-architectures", "-R", "=" + requirement, app.path])
    let infoURL = app.appendingPathComponent("Contents/Info.plist")
    guard let info = try PropertyListSerialization.propertyList(from: Data(contentsOf: infoURL), format: nil) as? [String: Any],
          info["CFBundleIdentifier"] as? String == bundleID,
          info["CFBundleShortVersionString"] as? String == asset.version,
          Int(String(describing: info["CFBundleVersion"] ?? "")) == asset.buildNumber else {
      throw MacUpdateError.invalid("更新包应用身份或版本与清单不一致")
    }
    let arches = try tool("/usr/bin/lipo", ["-archs", app.appendingPathComponent("Contents/MacOS/星河避难所").path])
    guard arches.trimmingCharacters(in: .whitespacesAndNewlines) == "arm64",
          FileManager.default.isExecutableFile(atPath: app.appendingPathComponent("Contents/Helpers/refuge_updater").path),
          FileManager.default.fileExists(atPath: app.appendingPathComponent("Contents/Resources/refuge-release.json").path) else {
      throw MacUpdateError.invalid("更新包不是完整的 Apple Silicon 版本")
    }
  }
  public static func json(_ value: Any, to url: URL) throws {
    let data = try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
    try data.write(to: url, options: [.atomic])
    try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
  }
  public static func prepare(zip: URL, asset: MacUpdateAsset, install: URL,
                             validateArchive: (URL) throws -> Void) throws -> MacUpdateRequest {
    guard supportsARM64 else { throw MacUpdateError.invalid("此更新仅支持 Apple Silicon") }
    let install = install.resolvingSymlinksInPath()
    let parent = install.deletingLastPathComponent()
    guard install.pathExtension == "app", !install.path.contains("/AppTranslocation/"),
          FileManager.default.isWritableFile(atPath: parent.path),
          !support.path.hasPrefix(install.path + "/") else {
      throw MacUpdateError.invalid("请把应用移至用户可写的本地目录（如 ~/Applications）后更新")
    }
    let identity = try requirement(install)
    let id = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    let transaction = support.appendingPathComponent("transactions/" + id)
    let stageRoot = parent.appendingPathComponent(".refuge-update-" + id)
    let staged = stageRoot.appendingPathComponent("星河避难所.app")
    try FileManager.default.createDirectory(at: transaction, withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
    try FileManager.default.createDirectory(at: stageRoot, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
    var prepared = false
    defer {
      if !prepared {
        try? FileManager.default.removeItem(at: stageRoot)
        try? FileManager.default.removeItem(at: transaction)
      }
    }
    let snapshot = transaction.appendingPathComponent("artifact.zip")
    try FileManager.default.copyItem(at: zip, to: snapshot)
    try checkZIP(snapshot, size: asset.size, sha256: asset.sha256)
    try validateArchive(snapshot)
    try tool("/usr/bin/ditto", ["-x", "-k", snapshot.path, stageRoot.path])
    try checkZIP(snapshot, size: asset.size, sha256: asset.sha256)
    try validateBundle(staged, asset: asset, requirement: identity)
    let current = NSRunningApplication.current
    guard let executable = current.executableURL, let launched = current.launchDate else {
      throw MacUpdateError.invalid("无法确认当前应用进程")
    }
    let request = MacUpdateRequest(schemaVersion: 1, id: id, parentPid: getpid(),
      parentExecutable: executable.resolvingSymlinksInPath().path,
      parentLaunchTime: launched.timeIntervalSince1970, installPath: install.path,
      stagedPath: staged.path, transactionPath: transaction.path, zipPath: snapshot.path,
      version: asset.version, buildNumber: asset.buildNumber, zipSize: asset.size, zipSha256: asset.sha256)
    try JSONEncoder().encode(request).write(to: transaction.appendingPathComponent("request.json"), options: [.atomic])
    try json(["id": id], to: support.appendingPathComponent("last-transaction.json"))
    let helper = transaction.appendingPathComponent("refuge_updater")
    try FileManager.default.copyItem(at: install.appendingPathComponent("Contents/Helpers/refuge_updater"), to: helper)
    let process = Process()
    process.executableURL = helper; process.arguments = [transaction.appendingPathComponent("request.json").path]
    process.standardInput = FileHandle.nullDevice
    let log = transaction.appendingPathComponent("helper.log")
    _ = FileManager.default.createFile(atPath: log.path, contents: nil, attributes: [.posixPermissions: 0o600])
    let output = try FileHandle(forWritingTo: log)
    process.standardOutput = output; process.standardError = output
    try process.run(); try? output.close()
    let deadline = Date().addingTimeInterval(60)
    while process.isRunning && Date() < deadline {
      let ready = transaction.appendingPathComponent("ready.json")
      if let data = try? Data(contentsOf: ready),
         let state = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
        guard state["state"] as? String == "ready" else {
          throw MacUpdateError.invalid(state["message"] as? String ?? "更新器启动失败")
        }
        prepared = true; return request
      }
      Thread.sleep(forTimeInterval: 0.1)
    }
    try Data("cancel".utf8).write(to: transaction.appendingPathComponent("cancel"), options: [.atomic])
    // The helper owns cleanup after launch, including a late-starting process.
    prepared = true
    throw MacUpdateError.invalid("更新器未能就绪，应用保持运行，请重试")
  }
  public static func validateRequest(_ request: MacUpdateRequest, root: URL = support) throws {
    guard request.schemaVersion == 1, request.id.count == 32,
          request.id.allSatisfy({ $0.isHexDigit && !$0.isUppercase }),
          request.parentPid > 1 else { throw MacUpdateError.invalid("更新事务无效") }
    let expected = root.appendingPathComponent("transactions/" + request.id).standardizedFileURL
    let install = URL(fileURLWithPath: request.installPath)
    let staged = install.deletingLastPathComponent().appendingPathComponent(".refuge-update-" + request.id + "/星河避难所.app")
    guard request.transactionPath == expected.path,
          expected.resolvingSymlinksInPath().path == expected.path,
          request.stagedPath == staged.path,
          staged.resolvingSymlinksInPath().path == staged.path,
          install.resolvingSymlinksInPath().path == install.path,
          request.parentExecutable == install.appendingPathComponent("Contents/MacOS/星河避难所").path,
          request.zipPath == expected.appendingPathComponent("artifact.zip").path else {
      throw MacUpdateError.invalid("更新事务路径无效")
    }
  }
  public static func exchange(_ left: URL, _ right: URL) throws {
    // Darwin's directory exchange is atomic and keeps the installation present.
    guard renameatx_np(AT_FDCWD, left.path, AT_FDCWD, right.path, UInt32(RENAME_SWAP)) == 0 else {
      throw MacUpdateError.invalid("无法替换应用：" + String(cString: strerror(errno)))
    }
  }
}

public enum MacUpdateRunner {
  public static func run(_ requestURL: URL) throws {
    let request = try JSONDecoder().decode(MacUpdateRequest.self, from: Data(contentsOf: requestURL))
    try MacUpdate.validateRequest(request)
    let transaction = URL(fileURLWithPath: request.transactionPath)
    guard requestURL.path == transaction.appendingPathComponent("request.json").path else {
      throw MacUpdateError.invalid("更新事务来源无效")
    }
    let install = URL(fileURLWithPath: request.installPath), staged = URL(fileURLWithPath: request.stagedPath)
    let asset = MacUpdateAsset(version: request.version, buildNumber: request.buildNumber,
                               size: request.zipSize, sha256: request.zipSha256)
    var swapped = false, launched = false
    do {
      guard let parent = NSRunningApplication(processIdentifier: request.parentPid),
            parent.executableURL?.resolvingSymlinksInPath().path == request.parentExecutable,
            parent.launchDate?.timeIntervalSince1970 == request.parentLaunchTime else {
        throw MacUpdateError.invalid("原应用进程已变化")
      }
      let identity = try MacUpdate.requirement(install)
      try MacUpdate.checkZIP(URL(fileURLWithPath: request.zipPath), size: request.zipSize, sha256: request.zipSha256)
      try MacUpdate.validateBundle(staged, asset: asset, requirement: identity)
      try MacUpdate.json(["state": "ready"], to: transaction.appendingPathComponent("ready.json"))
      let deadline = Date().addingTimeInterval(90)
      while let running = NSRunningApplication(processIdentifier: request.parentPid), !running.isTerminated,
            running.launchDate?.timeIntervalSince1970 == request.parentLaunchTime {
        if FileManager.default.fileExists(atPath: transaction.appendingPathComponent("cancel").path) {
          throw MacUpdateError.invalid("更新已取消")
        }
        guard Date() < deadline else { throw MacUpdateError.invalid("应用未退出，更新已停止") }
        Thread.sleep(forTimeInterval: 0.1)
      }
      guard FileManager.default.fileExists(atPath: transaction.appendingPathComponent("commit").path),
            !FileManager.default.fileExists(atPath: transaction.appendingPathComponent("cancel").path) else {
        throw MacUpdateError.invalid("更新未确认，保留原版")
      }
      // A second copy at this exact installation must not be replaced either.
      guard !NSWorkspace.shared.runningApplications.contains(where: {
        !$0.isTerminated && $0.bundleURL?.resolvingSymlinksInPath().path == install.path
      }) else { throw MacUpdateError.invalid("此安装目录还有应用实例正在运行") }
      try MacUpdate.validateBundle(staged, asset: asset, requirement: identity)
      try MacUpdate.json(["state": "replacing"], to: transaction.appendingPathComponent("result.json"))
      try MacUpdate.exchange(install, staged); swapped = true
      try launch(install, transaction: transaction); launched = true
      try MacUpdate.json(["state": "succeeded", "version": request.version,
                         "buildNumber": request.buildNumber, "backupPath": staged.path],
                        to: transaction.appendingPathComponent("result.json"))
    } catch {
      var message = error.localizedDescription
      if swapped && !launched {
        do { try MacUpdate.exchange(install, staged); try launch(install) }
        catch { message += "；恢复失败：" + error.localizedDescription }
      }
      try? MacUpdate.json(["state": "failed", "message": message],
                         to: transaction.appendingPathComponent("ready.json"))
      try? MacUpdate.json(["state": "failed", "message": message],
                         to: transaction.appendingPathComponent("result.json"))
      if !swapped { try? FileManager.default.removeItem(at: staged.deletingLastPathComponent()) }
      throw error
    }
  }
  public static func launch(_ app: URL, transaction: URL? = nil) throws {
    // Exact path; -n prevents Launch Services reusing a different installation.
    let marker = transaction?.appendingPathComponent("startup-" + UUID().uuidString + ".json")
    var args = ["-n", app.path]
    if let marker { args += ["--args", "--refuge-update-ready=" + marker.path] }
    try MacUpdate.tool("/usr/bin/open", args, timeout: 20)
    let expected = app.appendingPathComponent("Contents/MacOS/星河避难所").path
    let deadline = Date().addingTimeInterval(20)
    var observedPid: pid_t?, stableSince: Date?
    while Date() < deadline {
      let running = NSRunningApplication.runningApplications(withBundleIdentifier: MacUpdate.bundleID).first {
        !$0.isTerminated && $0.executableURL?.resolvingSymlinksInPath().path == expected
          && kill($0.processIdentifier, 0) == 0
      }
      if let running {
        if observedPid != running.processIdentifier {
          observedPid = running.processIdentifier; stableSince = Date()
        }
        // Launch Services can briefly register a process that immediately crashes.
        let frameReady: Bool
        if let marker, let data = try? Data(contentsOf: marker),
           let value = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
          frameReady = (value["pid"] as? Int32) == running.processIdentifier
        } else { frameReady = marker == nil }
        if frameReady, let stableSince, Date().timeIntervalSince(stableSince) >= 2 { return }
      } else { observedPid = nil; stableSince = nil }
      Thread.sleep(forTimeInterval: 0.1)
    }
    // NSRunningApplication.isTerminated can stay stale in a command-line
    // helper without a Cocoa event loop. Poll the OS, not the cached object.
    if let observedPid, let child = NSRunningApplication(processIdentifier: observedPid),
       child.executableURL?.resolvingSymlinksInPath().path == expected,
       kill(observedPid, 0) == 0 {
      kill(observedPid, SIGTERM)
      let stopDeadline = Date().addingTimeInterval(3)
      while kill(observedPid, 0) == 0 && Date() < stopDeadline {
        RunLoop.current.run(until: Date().addingTimeInterval(0.1))
      }
      if kill(observedPid, 0) == 0 {
        // Recheck the process identity before escalating this one failed child.
        if let current = NSRunningApplication(processIdentifier: observedPid),
           current.launchDate == child.launchDate,
           current.executableURL?.resolvingSymlinksInPath().path == expected {
          kill(observedPid, SIGKILL)
        }
      }
      let forceDeadline = Date().addingTimeInterval(5)
      while kill(observedPid, 0) == 0 && Date() < forceDeadline {
        RunLoop.current.run(until: Date().addingTimeInterval(0.1))
      }
      guard kill(observedPid, 0) != 0 else { throw MacUpdateError.invalid("新版未能退出，请手动恢复备份") }
    }
    throw MacUpdateError.invalid("新版应用未能启动，正在恢复旧版")
  }
}
