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
            name: "MySwiftUICore"
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
