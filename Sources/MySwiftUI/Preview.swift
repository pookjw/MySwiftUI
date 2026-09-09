public import DeveloperToolsSupport

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@freestanding(declaration) public macro Preview(
    _ name: String? = nil,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View,
    @DeveloperToolsSupport::PreviewCameraBuilder cameras: () -> [DeveloperToolsSupport::PreviewCamera]
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIViewPlus")

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@freestanding(declaration) public macro Preview<Style>(
    _ name: String? = nil,
    immersionStyle: Style,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIView") where Style : ImmersionStyle

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@freestanding(declaration) public macro Preview<Style>(
    _ name: String? = nil,
    immersionStyle: Style,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View,
    @DeveloperToolsSupport::PreviewCameraBuilder cameras: () -> [DeveloperToolsSupport::PreviewCamera]
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIViewPlus") where Style : ImmersionStyle

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@freestanding(declaration) public macro Preview<Style>(
    _ name: String? = nil,
    windowStyle: Style,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIView") where Style : WindowStyle

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@freestanding(declaration) public macro Preview<Style>(
    _ name: String? = nil,
    windowStyle: Style,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View,
    @DeveloperToolsSupport::PreviewCameraBuilder cameras: () -> [DeveloperToolsSupport::PreviewCamera]
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIViewPlus") where Style : WindowStyle

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@freestanding(declaration) public macro Preview(
    _ name: String? = nil,
    traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>,
    _ additionalTraits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
    @ViewBuilder body: @escaping @MainActor () -> any View
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIView")

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@freestanding(declaration) public macro Preview(
    _ name: String? = nil,
    @ViewBuilder body: @escaping @MainActor () -> any View
) = #externalMacro(module: "MyPreviewsMacros", type: "SwiftUIView")

extension DeveloperToolsSupport::Preview {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor public init(
        _ name: String? = nil,
        traits: DeveloperToolsSupport::PreviewTrait<DeveloperToolsSupport::Preview.ViewTraits>...,
        body: @escaping @MainActor () -> any View
    ) {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
@attached(peer) public macro Previewable() = #externalMacro(
    module: "MyPreviewsMacros",
    type: "Previewable"
)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct _Previewable {
    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _Previewable : Sendable {
}
