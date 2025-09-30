// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftUITraits",
    platforms: [
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "MySwiftUITraits",
            targets: [
                "_MySwiftUITraits"
            ]
        ),
    ],
    dependencies: [.package(path: "../")],
    targets: [
        .target(
            name: "_MySwiftUITraits",
            dependencies: [
                .byName(name: "MySwiftUI")
            ]
        ),
    ]
)
