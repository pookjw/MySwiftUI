public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@preconcurrency @MainActor
public protocol ButtonStyle {
    associatedtype Body : View

    @ViewBuilder @MainActor @preconcurrency
    func makeBody(configuration: Self.Configuration) -> Self.Body

    typealias Configuration = ButtonStyleConfiguration
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ButtonStyleConfiguration {
//    @MainActor @preconcurrency
//    public struct Label: View {
//        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//        public typealias Body = Never
//    }
//
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    public let role: ButtonRole?
//
//    public let label: ButtonStyleConfiguration.Label
//    public let isPressed: Bool
}

@available(*, unavailable)
extension ButtonStyleConfiguration : Sendable {}

//@available(*, unavailable)
//extension ButtonStyleConfiguration.Label: Sendable {}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    nonisolated public func buttonStyle<S>(_ style: S) -> some View where S : ButtonStyle {
        assertUnimplemented()
    }
}

package protocol ButtonStyleConvertible {
    associatedtype ButtonStyleRepresentation : ButtonStyle

    var buttonStyleRepresentation: Self.ButtonStyleRepresentation {
        get
    }
}
