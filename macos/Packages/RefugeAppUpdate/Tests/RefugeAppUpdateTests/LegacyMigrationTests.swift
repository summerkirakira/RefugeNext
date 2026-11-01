import Foundation
import XCTest
@testable import RefugeAppUpdate

final class LegacyMigrationTests: XCTestCase {
  func testCopyIsRestartableAndPreservesDestinationAndSource() throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    defer { try? FileManager.default.removeItem(at: root) }
    let source = root.appendingPathComponent("old")
    let target = root.appendingPathComponent("new")
    try FileManager.default.createDirectory(at: source, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(at: target, withIntermediateDirectories: true)
    try Data("old account".utf8).write(to: source.appendingPathComponent("account.json"))
    try Data("existing account".utf8).write(to: target.appendingPathComponent("account.json"))
    try Data("database".utf8).write(to: source.appendingPathComponent("game.db"))
    try LegacyDataMigration.copyMissing(source, target)
    try LegacyDataMigration.copyMissing(source, target)
    XCTAssertEqual(try String(contentsOf: target.appendingPathComponent("account.json")), "existing account")
    XCTAssertEqual(try Data(contentsOf: source.appendingPathComponent("game.db")), try Data(contentsOf: target.appendingPathComponent("game.db")))
  }
  func testMigrationCopiesPreferencesAndOnlyMarksAfterSuccess() throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    let suite = "refuge-test-" + UUID().uuidString
    let defaults = UserDefaults(suiteName: suite)!
    defer { defaults.removePersistentDomain(forName: suite); try? FileManager.default.removeItem(at: root) }
    let old = root.appendingPathComponent("Library/Containers/vip.kirakira.Refuge-ios/Data")
    let preferences = old.appendingPathComponent("Library/Preferences")
    try FileManager.default.createDirectory(at: preferences, withIntermediateDirectories: true)
    let data = try PropertyListSerialization.data(fromPropertyList: ["flutter.account": "a", "flutter.theme": "old"], format: .xml, options: 0)
    try data.write(to: preferences.appendingPathComponent("vip.kirakira.Refuge-ios.plist"))
    defaults.set("new", forKey: "flutter.theme")
    try LegacyDataMigration.run(home: root, defaults: defaults)
    XCTAssertEqual(defaults.string(forKey: "flutter.account"), "a")
    XCTAssertEqual(defaults.string(forKey: "flutter.theme"), "new")
    XCTAssertTrue(FileManager.default.fileExists(atPath: root.appendingPathComponent("Library/Application Support/vip.kirakira.Refuge-ios/legacy-sandbox-migrated.json").path))
  }
}
