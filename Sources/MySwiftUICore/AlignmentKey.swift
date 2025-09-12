@_documentation(visibility: private) @frozen public struct AlignmentKey : Hashable, Comparable {
    private let bits: UInt
    
    public static func < (lhs: AlignmentKey, rhs: AlignmentKey) -> Bool {
        fatalError("TODO")
    }
    
    public static func == (a: AlignmentKey, b: AlignmentKey) -> Swift.Bool {
        fatalError("TODO")
    }
}

extension AlignmentKey: Sendable {}
extension AlignmentKey: BitwiseCopyable {}
