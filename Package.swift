// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftUI",
    platforms: [
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "MySwiftUI",
            targets: [
                "MySwiftUI"
            ]
        ),
    ],
    targets: [
        .target(
            name: "MySwiftUI",
            dependencies: [
                .byName(name: "_UIKitPrivate"),
                .byName(name: "_UIKitShims"),
                .byName(name: "MySwiftUICore")
            ]
        ),
        .target(
            name: "MySwiftUICore",
            dependencies: [
            ]
        ),
        .target(
            name: "_UIKitShims"
        ),
        .binaryTarget(
            name: "AttributeGraph",
            path: "AttributeGraph.xcframework"
        ),
        .binaryTarget(
            name: "_UIKitPrivate",
            path: "_UIKitPrivate.xcframework"
        )
    ]
)
