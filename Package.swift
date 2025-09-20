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
                .byName(name: "_QuartzCorePrivate"),
                .byName(name: "StopwatchSupport"),
                .byName(name: "_UIKitPrivate"),
                .byName(name: "_UIKitShims"),
                .byName(name: "MySwiftUICore"),
                .byName(name: "RealitySimulationServices"),
                .byName(name: "MRUIKit")
            ],
            swiftSettings: [
                .enableExperimentalFeature("SymbolLinkageMarkers")
            ]
        ),
        .target(
            name: "MySwiftUICore",
            dependencies: [
                .byName(name: "_DyldPrivate"),
                .byName(name: "AttributeGraph"),
                .byName(name: "_KernPrivate"),
                .byName(name: "_MySwiftUIShims"),
                .byName(name: "FeatureFlags"),
                .byName(name: "StopwatchSupport")
            ],
            swiftSettings: [
                .unsafeFlags([
                    "-Xfrontend",
                    "-enable-private-imports"
                ])
            ],
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "_MySwiftUIShims",
            dependencies: [
                .byName(name: "_UIKitPrivate"),
                .byName(name: "BaseBoard"),
                .byName(name: "_DarwinPrivate")
            ],
            cSettings: [
                .unsafeFlags(["-fno-objc-arc", "-std=gnu23"])
            ]
        ),
        .target(
            name: "_UIKitShims",
            dependencies: [
                .byName(name: "_UIKitPrivate"),
                .byName(name: "MySwiftUICore")
            ]
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
        .binaryTarget(
            name: "FeatureFlags",
            path: "FeatureFlags.xcframework"
        ),
        .binaryTarget(
            name: "StopwatchSupport",
            path: "StopwatchSupport.xcframework"
        ),
        .target(
            name: "_KernPrivate",
        ),
        .target(
            name: "_DarwinPrivate"
        ),
        .target(
            name: "MySwiftUITestUtils"
        ),
        .testTarget(
            name: "MySwiftUITests",
            dependencies: [
                .byName(name: "MySwiftUI"),
                .byName(name: "_SwiftUIPrivate"),
                .byName(name: "MySwiftUITestUtils")
            ]
        ),
        .testTarget(
            name: "MySwiftUICoreTests",
            dependencies: [
                .byName(name: "MySwiftUICore"),
                .byName(name: "MySwiftUITestUtils")
            ]
        )
    ]
)
