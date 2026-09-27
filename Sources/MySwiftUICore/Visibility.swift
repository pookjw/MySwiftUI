@frozen
public enum Visibility : Int, Hashable, CaseIterable {
    case automatic
    case visible
    case hidden
    
    package func isVisible(automatic: @autoclosure () -> Bool) -> Bool {
        assertUnimplemented()
    }
}
