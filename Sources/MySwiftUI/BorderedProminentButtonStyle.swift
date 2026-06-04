public import MySwiftUICore

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct BorderedProminentButtonStyle : PrimitiveButtonStyle {
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: BorderedProminentButtonStyle.Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension BorderedProminentButtonStyle : Sendable {
}
