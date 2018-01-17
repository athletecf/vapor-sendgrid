// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "VaporSendgrid",
    products: [
        .library(
            name: "VaporSendgrid",
            targets: ["VaporSendgrid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .branch("beta"))
    ],
    targets: [
        .target(
            name: "VaporSendgrid",
            dependencies: ["Vapor"]),
        .testTarget(
            name: "VaporSendgridTests",
            dependencies: ["VaporSendgrid"]),
    ]
)
