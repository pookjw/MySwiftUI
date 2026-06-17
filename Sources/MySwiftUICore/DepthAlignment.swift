// FF4AA3017C479A3490214166934C8850
public import CoreGraphics

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct DepthAlignment : Equatable, Sendable {
    init(_ id: any AlignmentID.Type) {
        // axis는 알 수 없음 - typeCache에 저장만 하는 용도
        let key = AlignmentKey(id: id, axis: .horizontal)
        
        func project<T : AlignmentID>(_ type: T.Type) -> DepthAlignmentKey {
            return DepthAlignmentKey(id: ToDepthAlignmentIDAdaptor<T>.self)
        }
        
        self.depthKey = _openExistential(key.id, do: project)
    }
    
    public init(_ id: any DepthAlignmentID.Type) {
        self.depthKey = DepthAlignmentKey(id: id)
    }
    
    @_documentation(visibility: private) public var depthKey: DepthAlignmentKey
    
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Swift.Sequence, S.Element == CGFloat? {
        assertUnimplemented()
    }
}

@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension DepthAlignment {
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        assertUnimplemented()
    }
}

fileprivate struct ToDepthAlignmentIDAdaptor<T : AlignmentID> : DepthAlignmentID {
    static func defaultValue(in context: ViewDimensions3D) -> CGFloat {
        assertUnimplemented()
    }
    
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        assertUnimplemented()
    }
}
