public enum LayoutDirection: Hashable, CaseIterable, Sendable {
    case leftToRight
    case rightToLeft
    
    package var opposite: LayoutDirection {
        switch self {
        case .leftToRight:
            return .rightToLeft
        case .rightToLeft:
            return .leftToRight
        }
    }
}
