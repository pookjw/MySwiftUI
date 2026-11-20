public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PrimitiveButtonStyle where Self == DefaultButtonStyle {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var automatic: DefaultButtonStyle {
        .init()
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }

    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension DefaultButtonStyle : Sendable {}
