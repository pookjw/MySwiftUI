struct PresentationPassthroughBehavior : Equatable {
    private var kind: PresentationPassthroughBehavior.Kind
    
    static var automatic: PresentationPassthroughBehavior {
        return PresentationPassthroughBehavior(kind: .automatic)
    }
    
    static var disabled: PresentationPassthroughBehavior {
        return PresentationPassthroughBehavior(kind: .disabled)
    }
    
    static var enabled: PresentationPassthroughBehavior {
        return PresentationPassthroughBehavior(kind: .enabled)
    }
}

extension PresentationPassthroughBehavior {
    enum Kind : Hashable {
        case automatic
        case disabled
        case enabled
    }
}
