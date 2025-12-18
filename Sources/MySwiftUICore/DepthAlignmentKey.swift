
@_documentation(visibility: private) public struct DepthAlignmentKey : Hashable, Comparable, Sendable {
    private let bits: UInt
    
    public static func < (lhs: DepthAlignmentKey, rhs: DepthAlignmentKey) -> Bool {
        fatalError("TODO")
    }
    
    public static func == (a: DepthAlignmentKey, b: DepthAlignmentKey) -> Bool {
        fatalError("TODO")
    }
}
