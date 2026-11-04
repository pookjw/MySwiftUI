public import MySwiftUICore

@preconcurrency @MainActor public protocol ToggleStyle {
    associatedtype Body : View
    @ViewBuilder @MainActor @preconcurrency func makeBody(configuration: Self.Configuration) -> Self.Body
    typealias Configuration = ToggleStyleConfiguration
}

public struct ToggleStyleConfiguration {
    @MainActor @preconcurrency public struct Label : View, ViewAlias {
        public typealias Body = Never
    }
    
    public let label: ToggleStyleConfiguration.Label
    @Binding public var isOn: Bool
    @Binding private var toggleState: ToggleState
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public var isMixed: Bool
    
    private var effect: ToggleStyleConfiguration.Effect
}

@available(*, unavailable)
extension ToggleStyleConfiguration : Sendable {
}

@available(*, unavailable)
extension ToggleStyleConfiguration.Label : Sendable {
}

extension View {
    nonisolated public func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle {
        assertUnimplemented()
    }
}

extension ToggleStyleConfiguration {
    enum Effect {
//        case appIntent(AppIntentAction)
        case binding
    }
}
