// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabLight",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "TabLight",
            targets: ["TabLight"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TabLight",
            dependencies:[])
    ]
)
