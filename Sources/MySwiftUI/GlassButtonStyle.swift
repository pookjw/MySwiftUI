public import MySwiftUICore

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
extension PrimitiveButtonStyle where Self == GlassButtonStyle {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var glass: GlassButtonStyle { .init() }
    @MainActor @preconcurrency public static func glass(_ glass: Glass) -> Self { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
public struct GlassButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @available(iOS 26.1, macOS 26.1, tvOS 26.1, watchOS 26.1, *)
    public init(_ glass: Glass) { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GlassButtonStyle : Sendable {}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
extension PrimitiveButtonStyle where Self == GlassProminentButtonStyle {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var glassProminent: GlassProminentButtonStyle { .init() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
@available(visionOS, unavailable)
public struct GlassProminentButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GlassProminentButtonStyle : Sendable {}
