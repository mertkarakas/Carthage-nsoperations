// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Carthage",
    products: [
        .library(name: "XCDBLD", targets: ["XCDBLD"]),
        .library(name: "CarthageKit", targets: ["CarthageKit"]),
        .executable(name: "carthage", targets: ["carthage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/antitypical/Result.git", from: "4.1.0"),
        .package(url: "https://github.com/nsoperations/ReactiveTask.git", .branch("fix/handle-launch-exceptions")),
        .package(url: "https://github.com/Carthage/Commandant.git", from: "0.15.0"),
        .package(url: "https://github.com/jdhealy/PrettyColors.git", from: "5.0.2"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: "4.0.0"),
        .package(url: "https://github.com/mdiep/Tentacle.git", from: "0.12.0"),
        .package(url: "https://github.com/thoughtbot/Curry.git", from: "4.0.2"),
        .package(url: "https://github.com/werner77/BTree.git", .branch("bugfix/fix-package-description")),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.3.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", .revision("swift-DEVELOPMENT-SNAPSHOT-2019-03-04-a")),
    ],
    targets: [
        .target(
            name: "XCDBLD",
            dependencies: ["Result", "ReactiveSwift", "ReactiveTask"]
        ),
        .testTarget(
            name: "XCDBLDTests",
            dependencies: ["XCDBLD", "Nimble"]
        ),
        .target(
            name: "CarthageKit",
            dependencies: ["XCDBLD", "Tentacle", "Curry", "SwiftPM-auto", "BTree"]
        ),
        .testTarget(
            name: "CarthageKitTests",
            dependencies: ["CarthageKit", "Nimble"],
            exclude: ["Resources/FakeOldObjc.framework"]
        ),
        .target(
            name: "carthage",
            dependencies: ["XCDBLD", "CarthageKit", "Commandant", "Curry", "PrettyColors"],
            exclude: ["swift-is-crashy.c"]
        ),
    ],
    swiftLanguageVersions: [4]
)
