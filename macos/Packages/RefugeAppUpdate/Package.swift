// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "RefugeAppUpdate",
  platforms: [.macOS(.v12)],
  products: [
    .library(name: "RefugeAppUpdate", targets: ["RefugeAppUpdate"]),
    .executable(name: "refuge_updater", targets: ["RefugeUpdater"]),
  ],
  targets: [
    .target(name: "RefugeAppUpdate"),
    .executableTarget(name: "RefugeUpdater", dependencies: ["RefugeAppUpdate"]),
    .testTarget(name: "RefugeAppUpdateTests", dependencies: ["RefugeAppUpdate"]),
  ],
  swiftLanguageVersions: [.v5]
)
