// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MySwiftUI",
    products: [
        .library(
            name: "MySwiftUI",
            targets: ["MySwiftUI"]
        ),
        .library(
            name: "MySwiftUICore",
            targets: ["MySwiftUICore"]
        ),
        .library(
            name: "_MySwiftUICShims",
            targets: ["_MySwiftUICShims"]
        ),
        .library(
            name: "_MyObservation",
            targets: ["_MyObservation"]
        ),
        .library(
            name: "AttributeGraph",
            targets: ["AttributeGraph"]
        )
    ],
    targets: [
        .target(
            name: "MySwiftUI",
            dependencies: [
                .byName(name: "MySwiftUICore")
            ]
        ),
        .target(
            name: "MySwiftUICore",
            dependencies: [
                .byName(name: "_MySwiftUICShims"),
                .byName(name: "_MyObservation"),
                .byName(name: "AttributeGraph")
            ],
            swiftSettings: [
                .unsafeFlags(["-enable-private-imports"]),
                .enableExperimentalFeature("RawLayout")
            ]
        ),
        .target(
            name: "_MySwiftUICShims"
        ),
        .testTarget(
            name: "MySwiftUITests",
            dependencies: ["MySwiftUI"]
        ),
        .testTarget(
            name: "MySwiftUICoreTests",
            dependencies: ["MySwiftUICore"]
        ),
        .binaryTarget(
            name: "_MyObservation",
            path: "Sources/_MyObservation/_MyObservation.xcframework"
        ),
        .binaryTarget(
            name: "AttributeGraph",
            path: "Sources/AttributeGraph/AttributeGraph.xcframework"
        )
    ]
)
