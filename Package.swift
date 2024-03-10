// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tabfinity",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Tabfinity",
            targets: ["Tabfinity"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Tabfinity",
            dependencies:[])
    ]
)
