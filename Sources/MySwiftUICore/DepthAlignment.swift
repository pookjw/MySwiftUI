public import CoreGraphics

@frozen public struct DepthAlignment : Equatable, Sendable {
    public init(_ id: any DepthAlignmentID.Type) {
        fatalError("TODO")
    }
    
    @_documentation(visibility: private) public var depthKey: DepthAlignmentKey
    
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Swift.Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

extension DepthAlignment {
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}

extension DepthAlignment {
    public static let front: DepthAlignment = {
        fatalError("TODO")
    }()
    
    public static let center: DepthAlignment = {
        fatalError("TODO")
    }()
    
    public static let back: DepthAlignment = {
        fatalError("TODO")
    }()
}
