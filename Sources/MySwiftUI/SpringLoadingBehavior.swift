internal import MySwiftUICore

public struct SpringLoadingBehavior : Hashable, Sendable {
    public static let automatic = SpringLoadingBehavior(guts: .automatic)
    public static let enabled = SpringLoadingBehavior(guts: .enabled)
    public static let disabled = SpringLoadingBehavior(guts: .disabled)
    
    private var guts: Guts
}

extension SpringLoadingBehavior {
    enum HighlightState : Hashable {
        case none
        case standard
        case prominent
    }
}

extension SpringLoadingBehavior {
    fileprivate enum Guts : Hashable {
        case automatic
        case enabled
        case disabled
    }
}

extension SpringLoadingBehavior {
    struct Key : EnvironmentKey {
        static var defaultValue: SpringLoadingBehavior {
            return .automatic
        }
    }
}

extension EnvironmentValues {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public var springLoadingBehavior: SpringLoadingBehavior {
        get {
            return self[SpringLoadingBehavior.Key.self]
        }
        set {
            self[SpringLoadingBehavior.Key.self] = newValue
        }
    }
}

extension View {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public func springLoadingBehavior(_ behavior: SpringLoadingBehavior) -> some View {
        assertUnimplemented()
    }
}


extension SpringLoadingBehavior {
    struct HasCustomSpringLoadedBehavior : PropertyKey, _GraphInputsModifier, ViewInputPredicate, GraphInput, ViewInputBoolFlag, ViewInputFlag {
    }
}
