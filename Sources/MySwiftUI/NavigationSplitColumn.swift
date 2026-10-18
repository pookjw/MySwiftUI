enum NavigationSplitColumn {
    case sidebar
    case content
    case detail
    case stack
    case collapsed
    case inspector
} 

extension NavigationSplitColumn : Hashable, Comparable, CustomStringConvertible {
    static func < (lhs: NavigationSplitColumn, rhs: NavigationSplitColumn) -> Bool {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
