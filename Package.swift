// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MySwiftUI",
    products: [
        .library(
            name: "MySwiftUI",
            type: .dynamic,
            targets: ["MySwiftUI"]
        ),
        .library(
            name: "MySwiftUICore",
            type: .static,
            targets: ["MySwiftUICore"]
        ),
        .library(
            name: "_MySwiftUICShims",
            type: .static,
            targets: ["_MySwiftUICShims"]
        )
    ],
    targets: [
        .target(
            name: "MySwiftUI",
            dependencies: [
                .byName(name: "MySwiftUICore"),
                .byName(name: "_MySwiftUICShims")
            ]
        ),
        .target(
            name: "MySwiftUICore",
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
        )
    ]
)
