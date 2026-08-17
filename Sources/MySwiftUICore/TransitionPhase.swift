@frozen public enum TransitionPhase {
    case willAppear
    case identity
    case didDisappear
    
    public var isIdentity: Bool {
        return self == .identity
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension TransitionPhase {
    public var value: Double {
        switch self {
        case .willAppear:
            return -1
        case .identity:
            return 0
        case .didDisappear:
            return 1
        }
    }
}

extension TransitionPhase : Hashable {}
extension TransitionPhase : Sendable {}
extension TransitionPhase : BitwiseCopyable {}
