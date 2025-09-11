package enum EventPhase: Hashable {
    case began
    case active
    case ended
    case failed
}

extension EventPhase {
    package var isTerminal: Bool {
        switch self {
        case .ended, .failed:
            return true
        default:
            return false
        }
    }
}
