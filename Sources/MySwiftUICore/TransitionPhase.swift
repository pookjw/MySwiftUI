@frozen public enum TransitionPhase {
    case willAppear
    case identity
    case didDisappear
    
    public var isIdentity: Bool {
        fatalError("TODO")
    }
    
    public func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
}

extension TransitionPhase {
    public var value: Double {
        fatalError("TODO")
    }
}

extension TransitionPhase: Hashable {}
extension TransitionPhase: Sendable {}
extension TransitionPhase: BitwiseCopyable {}
