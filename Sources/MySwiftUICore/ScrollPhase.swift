@frozen
public enum ScrollPhase: Hashable, CustomDebugStringConvertible {
    case idle
    case tracking
    case interacting
    case decelerating
    case animating
    
    public var debugDescription: String {
        switch self {
        case .idle:
            return "idle"
        case .tracking:
            return "tracking"
        case .interacting:
            return "interacting"
        case .decelerating:
            return "decelerating"
        case .animating:
            return "animating"
        }
    }
    
    public var isScrolling: Bool {
        switch self {
        case .idle:
            return false
        case .tracking:
            return true
        case .interacting:
            return true
        case .decelerating:
            return true
        case .animating:
            return true
        }
    }
}
