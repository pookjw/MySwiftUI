internal import MySwiftUICore

public struct SpringLoadingBehavior: Hashable, Sendable {
    public static let automatic = SpringLoadingBehavior(guts: .automatic)
    public static let enabled = SpringLoadingBehavior(guts: .enabled)
    public static let disabled = SpringLoadingBehavior(guts: .disabled)
    
    private var guts: Guts
}

extension SpringLoadingBehavior {
    enum HighlightState: Hashable {
        case none
        case standard
        case prominent
    }
}

extension SpringLoadingBehavior {
    fileprivate enum Guts: Hashable {
        case automatic
        case enabled
        case disabled
    }
}

extension SpringLoadingBehavior {
    struct Key {
    }
}


extension SpringLoadingBehavior {
    struct HasCustomSpringLoadedBehavior: PropertyKey, _GraphInputsModifier, ViewInputPredicate, GraphInput, ViewInputBoolFlag, ViewInputFlag {
    }
}
