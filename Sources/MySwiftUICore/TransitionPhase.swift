@frozen public enum TransitionPhase {
    case willAppear
    case identity
    case didDisappear
    
    public var isIdentity: Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension TransitionPhase {
    public var value: Double {
        assertUnimplemented()
    }
}

extension TransitionPhase: Hashable {}
extension TransitionPhase: Sendable {}
extension TransitionPhase: BitwiseCopyable {}
