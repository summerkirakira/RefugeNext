import Foundation
import XCTest
@testable import RefugeAppUpdate

final class MacUpdateTests: XCTestCase {
  private var base: [MacArchiveEntry] {
    ["Info.plist", "MacOS/星河避难所", "Helpers/refuge_updater",
     "Resources/refuge-release.json", "_CodeSignature/CodeResources"].map {
      MacArchiveEntry(path: "星河避难所.app/Contents/" + $0, size: 1)
    }
  }
  func testFrameworkLinksRemainInsideTheBundle() throws {
    let p = "星河避难所.app/Contents/Frameworks/Test.framework/"
    try MacArchivePolicy.validate(base + [
      MacArchiveEntry(path: p + "Versions/A", size: 0),
      MacArchiveEntry(path: p + "Versions/A/Test", size: 1),
      MacArchiveEntry(path: p + "Versions/Current", size: 1, link: "A"),
      MacArchiveEntry(path: p + "Test", size: 1, link: "Versions/Current/Test"),
    ])
  }
  func testRejectsEscapesDuplicatesAndSymlinkWrites() {
    for path in ["../escape", "/absolute", "星河避难所.app/../escape",
                 "星河避难所.app/Contents/Info.plist", "星河避难所.app/contents/info.plist"] {
      XCTAssertThrowsError(try MacArchivePolicy.validate(base + [MacArchiveEntry(path: path, size: 1)]))
    }
    XCTAssertThrowsError(try MacArchivePolicy.validate(base + [
      MacArchiveEntry(path: "星河避难所.app/Contents/link", size: 1, link: "../../../outside")
    ]))
    XCTAssertThrowsError(try MacArchivePolicy.validate(base + [
      MacArchiveEntry(path: "星河避难所.app/Contents/link", size: 1, link: "MacOS"),
      MacArchiveEntry(path: "星河避难所.app/Contents/link/evil", size: 1)
    ]))
    XCTAssertThrowsError(try MacArchivePolicy.validate(base + [
      MacArchiveEntry(path: "星河避难所.app/Contents/a", size: 1, link: "b"),
      MacArchiveEntry(path: "星河避难所.app/Contents/b", size: 1, link: "a")
    ]))
  }
  func testRejectsMissingHelperAndDecompressionBomb() {
    XCTAssertThrowsError(try MacArchivePolicy.validate(Array(base.dropFirst(3))))
    XCTAssertThrowsError(try MacArchivePolicy.validate(base + [
      MacArchiveEntry(path: "星河避难所.app/Contents/huge", size: UInt64.max)
    ]))
  }
  func testDownloadedZIPRequiresActualSizeAndChecksum() throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    defer { try? FileManager.default.removeItem(at: root) }
    let file = root.appendingPathComponent("artifact.zip")
    try Data("test".utf8).write(to: file)
    try MacUpdate.checkZIP(file, size: 4, sha256: MacUpdate.hash(file))
    XCTAssertThrowsError(try MacUpdate.checkZIP(file, size: 3, sha256: MacUpdate.hash(file)))
    XCTAssertThrowsError(try MacUpdate.checkZIP(file, size: 4, sha256: String(repeating: "0", count: 64)))
  }
  func testAtomicExchangeCanRollBackWithoutChangingUserData() throws {
    let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    defer { try? FileManager.default.removeItem(at: root) }
    let a = root.appendingPathComponent("Installed.app"), b = root.appendingPathComponent("Staged.app")
    try FileManager.default.createDirectory(at: a, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(at: b, withIntermediateDirectories: true)
    try Data("A".utf8).write(to: a.appendingPathComponent("version"))
    try Data("B".utf8).write(to: b.appendingPathComponent("version"))
    let data = root.appendingPathComponent("user.sqlite")
    try Data("user data".utf8).write(to: data)
    try MacUpdate.exchange(a, b)
    XCTAssertEqual(try String(contentsOf: a.appendingPathComponent("version"), encoding: .utf8), "B")
    XCTAssertEqual(try String(contentsOf: b.appendingPathComponent("version"), encoding: .utf8), "A")
    try MacUpdate.exchange(a, b)
    XCTAssertEqual(try String(contentsOf: a.appendingPathComponent("version"), encoding: .utf8), "A")
    XCTAssertEqual(try String(contentsOf: data, encoding: .utf8), "user data")
  }
}
