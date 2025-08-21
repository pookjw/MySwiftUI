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
                .byName(name: "MySwiftUICore"),
                .byName(name: "RealitySimulationServices"),
                .byName(name: "MRUIKit"),
                .byName(name: "BaseBoard"),
            ]
        ),
        .target(
            name: "MySwiftUICore",
            dependencies: [
                .byName(name: "_DyldPrivate"),
                .byName(name: "AttributeGraph"),
                .byName(name: "_MySwiftUIShims")
            ]
        ),
        .target(
            name: "_MySwiftUIShims",
            dependencies: [
                .byName(name: "_UIKitPrivate")
            ],
            cSettings: [
                .unsafeFlags(["-fno-objc-arc"])
            ]
        ),
        .target(
            name: "_UIKitShims"
        ),
        .target(
            name: "_DyldPrivate"
        ),
        .binaryTarget(
            name: "AttributeGraph",
            path: "AttributeGraph.xcframework"
        ),
        .binaryTarget(
            name: "_UIKitPrivate",
            path: "_UIKitPrivate.xcframework"
        ),
        .binaryTarget(
            name: "_SwiftUIPrivate",
            path: "_SwiftUIPrivate.xcframework"
        ),
        .binaryTarget(
            name: "MRUIKit",
            path: "MRUIKit.xcframework"
        ),
        .binaryTarget(
            name: "BaseBoard",
            path: "BaseBoard.xcframework"
        ),
        .binaryTarget(
            name: "RealitySimulationServices",
            path: "RealitySimulationServices.xcframework"
        ),
        .binaryTarget(
            name: "_QuartzCorePrivate",
            path: "_QuartzCorePrivate.xcframework"
        ),
        .testTarget(
            name: "MySwiftUITests",
            dependencies: [
                .byName(name: "MySwiftUI"),
                .byName(name: "_SwiftUIPrivate")
            ]
        )
    ]
)
