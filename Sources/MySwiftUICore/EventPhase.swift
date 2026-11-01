@_spi(Internal) public enum EventPhase : Hashable {
    case began
    case active
    case ended
    case failed
}

extension EventPhase {
    @_spi(Internal) public var isTerminal: Bool {
        switch self {
        case .ended, .failed:
            return true
        default:
            return false
        }
    }
}
