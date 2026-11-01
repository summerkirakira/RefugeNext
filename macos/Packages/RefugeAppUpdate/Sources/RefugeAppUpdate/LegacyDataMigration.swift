import Foundation

/// A copy-only, restartable transition from the old sandbox. Existing destination
/// files/preferences win. The marker is written only after every copy succeeds.
public enum LegacyDataMigration {
  public static func run(home: URL = FileManager.default.homeDirectoryForCurrentUser,
                         defaults: UserDefaults = .standard) throws {
    let fm = FileManager.default
    let old = home.appendingPathComponent("Library/Containers/vip.kirakira.Refuge-ios/Data")
    let support = home.appendingPathComponent("Library/Application Support/vip.kirakira.Refuge-ios")
    let marker = support.appendingPathComponent("legacy-sandbox-migrated.json")
    if fm.fileExists(atPath: marker.path) { return }
    // contentsOfDirectory distinguishes permission denial from an empty/missing
    // container. A denied migration must not silently start with an empty account.
    do { _ = try fm.contentsOfDirectory(at: old, includingPropertiesForKeys: nil) }
    catch let error as NSError where error.domain == NSCocoaErrorDomain && error.code == NSFileReadNoSuchFileError { return }
    try copyMissing(old.appendingPathComponent("Documents"), home.appendingPathComponent("Documents"))
    try copyMissing(old.appendingPathComponent("Library/Application Support/vip.kirakira.Refuge-ios"), support)
    let preferences = old.appendingPathComponent("Library/Preferences/vip.kirakira.Refuge-ios.plist")
    if fm.fileExists(atPath: preferences.path) {
      let data = try Data(contentsOf: preferences)
      guard let values = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else {
        throw MacUpdateError.invalid("旧版设置无法读取，迁移已停止")
      }
      for (key, value) in values where defaults.object(forKey: key) == nil { defaults.set(value, forKey: key) }
      guard defaults.synchronize() else { throw MacUpdateError.invalid("无法保存迁移后的设置") }
    }
    try fm.createDirectory(at: support, withIntermediateDirectories: true)
    try Data("{\"version\":1}".utf8).write(to: marker, options: [.atomic])
  }

  public static func copyMissing(_ source: URL, _ destination: URL) throws {
    let fm = FileManager.default
    let values: URLResourceValues
    do { values = try source.resourceValues(forKeys: [.isDirectoryKey, .isSymbolicLinkKey]) }
    catch let error as NSError where error.domain == NSCocoaErrorDomain && error.code == NSFileReadNoSuchFileError { return }
    // Sandbox Documents may contain a link to the real Documents directory.
    if source.resolvingSymlinksInPath().path == destination.resolvingSymlinksInPath().path { return }
    guard values.isSymbolicLink != true else { return }
    if values.isDirectory == true {
      try fm.createDirectory(at: destination, withIntermediateDirectories: true)
      for child in try fm.contentsOfDirectory(at: source, includingPropertiesForKeys: nil) {
        try copyMissing(child, destination.appendingPathComponent(child.lastPathComponent))
      }
    } else if !fm.fileExists(atPath: destination.path) {
      try fm.createDirectory(at: destination.deletingLastPathComponent(), withIntermediateDirectories: true)
      let temporary = destination.deletingLastPathComponent().appendingPathComponent(".refuge-migrate-" + UUID().uuidString)
      defer { try? fm.removeItem(at: temporary) }
      try fm.copyItem(at: source, to: temporary)
      try fm.moveItem(at: temporary, to: destination)
    }
  }
}
