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
    traits: [
        .trait(name: "SwiftUICompataibility"),
        .`default`(enabledTraits: ["SwiftUICompataibility"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MySwiftUI",
            dependencies: [
                .byName(name: "_QuartzCorePrivate"),
                .byName(name: "StopwatchSupport"),
                .byName(name: "CoreRE"),
                .byName(name: "RealitySimulationServices"),
                .byName(name: "_UIKitPrivate"),
                .byName(name: "_UIKitShims"),
                .byName(name: "MySwiftUICore"),
                .byName(name: "MRUIKit"),
                .byName(name: "DesignLibrary"),
                .byName(name: "_DesignLibraryShims"),
                .byName(name: "TCC"),
                .byName(name: "UIAccessibility"),
                .byName(name: "FrontBoardServices"),
                .byName(name: "UIIntelligenceSupport")
            ],
            swiftSettings: [
                .strictMemorySafety(),
                .enableExperimentalFeature("SymbolLinkageMarkers"),
//                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances")
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
                .byName(name: "StopwatchSupport"),
                .byName(name: "RenderBox"),
                .byName(name: "_SwiftUIPrivate", condition: .when(traits: ["SwiftUICompataibility"])),
                .byName(name: "_ObservationPrivate")
            ],
            swiftSettings: [
                .strictMemorySafety(),
                .enableExperimentalFeature("Extern"),
                .unsafeFlags([
                    "-Xfrontend",
                    "-enable-private-imports"
                ]),
//                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances")
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
                .byName(name: "_DarwinPrivate"),
                .byName(name: "_QuartzCorePrivate")
            ],
            cSettings: [
                .unsafeFlags(["-fno-objc-arc", "-std=gnu23"])
            ]
        ),
        .target(
            name: "_UIKitShims",
            dependencies: [
                .byName(name: "_UIKitPrivate"),
                .byName(name: "MySwiftUICore"),
                .byName(name: "DesignLibrary"),
                .byName(name: "_DesignLibraryShims"),
                .byName(name: "_SwiftUICorePrivate", condition: .when(traits: ["SwiftUICompataibility"])),
                .byName(name: "_SwiftUIPrivate", condition: .when(traits: ["SwiftUICompataibility"]))
            ],
            swiftSettings: [
                .strictMemorySafety(),
//                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances")
            ]
        ),
        .target(
            name: "_DesignLibraryShims",
            dependencies: [
                .byName(name: "DesignLibrary"),
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
            name: "_SwiftUICorePrivate",
            path: "_SwiftUICorePrivate.xcframework"
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
        .binaryTarget(
            name: "_CoreFoundationPrivate",
            path: "_CoreFoundationPrivate.xcframework"
        ),
        .binaryTarget(
            name: "CoreRE",
            path: "CoreRE.xcframework"
        ),
        .binaryTarget(
            name: "DesignLibrary",
            path: "DesignLibrary.xcframework"
        ),
        .binaryTarget(
            name: "TCC",
            path: "TCC.xcframework"
        ),
        .binaryTarget(
            name: "RenderBox",
            path: "RenderBox.xcframework"
        ),
        .binaryTarget(
            name: "UIAccessibility",
            path: "UIAccessibility.xcframework"
        ),
        .binaryTarget(
            name: "FrontBoardServices",
            path: "FrontBoardServices.xcframework"
        ),
        .binaryTarget(
            name: "UIIntelligenceSupport",
            path: "UIIntelligenceSupport.xcframework"
        ),
        .binaryTarget(
            name: "_ObservationPrivate",
            path: "_ObservationPrivate.xcframework"
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
            ],
            swiftSettings: [
                .strictMemorySafety(),
//                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances")
            ]
        ),
        .testTarget(
            name: "MySwiftUICoreTests",
            dependencies: [
                .byName(name: "MySwiftUICore"),
                .byName(name: "MySwiftUITestUtils"),
                .byName(name: "_SwiftUICorePrivate"),
            ],
            swiftSettings: [
                .strictMemorySafety(),
//                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
                .enableUpcomingFeature("InferIsolatedConformances")
            ]
        )
    ]
)
