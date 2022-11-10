// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RDCld2",
    products: [
        .library(name: "RDCld2", targets: ["RDCld2"])
    ],
    targets: [
        .target(name: "cld2"),
        .target(name: "RDCld2", dependencies: ["cld2"]),
        .testTarget(name: "RDCld2Tests", dependencies: ["RDCld2"])
    ],
    cxxLanguageStandard: .cxx98
)
