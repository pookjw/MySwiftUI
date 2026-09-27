@frozen
public enum Visibility : Int, Hashable, CaseIterable {
    case automatic
    case visible
    case hidden
    
    package func isVisible(automatic: @autoclosure () -> Bool) -> Bool {
        switch self {
        case .automatic:
            return automatic()
        case .visible:
            return true
        case .hidden:
            return false
        }
    }
}
