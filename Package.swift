// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APIHelpers",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "APIHelpers",
            targets: ["APIHelpers"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        /// While this is deprecated, it is the only way I can access the packages .
//        .package(name: "Callable", url: "https://github.com/ElevatedUnderdogs/Callable.git", .upToNextMajor(from: "1.0.1")),
        .package(url: "https://github.com/ElevatedUnderdogs/Callable.git", .upToNextMajor(from: Version(1, 0, 1)))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "APIHelpers",
            dependencies: ["Callable"]),
        .testTarget(
            name: "APIHelpersTests",
            dependencies: ["APIHelpers"]),
    ]
)
