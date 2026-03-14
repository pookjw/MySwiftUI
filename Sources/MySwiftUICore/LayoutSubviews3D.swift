internal import CoreGraphics
internal import Spatial

struct LayoutSubviews3D {
    private var storage: LayoutSubviews
}

struct LayoutSubview3D {
    var base: LayoutSubview
    
    func depthThatFits(_ size: _ProposedSize3D) -> CGFloat {
        return base.proxy.depth(in: size)
    }
}

struct ViewLayoutEngine3D<L: Layout>: DefaultAlignmentFunction3D, LayoutEngine {
    private var base: ViewLayoutEngine<L>
    private var depthCache: Cache3<_ProposedSize3D, CGFloat>
    private var cachedDepthAlignmentSize: ViewSize3D
    private var cachedDepthAlignmentGeometry: [ViewDepthGeometry]
    private var cachedDepthAlignment: Cache3<ObjectIdentifier, CGFloat?>
    
    func update(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        assertUnimplemented()
    }
    
    init(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        assertUnimplemented()
    }
    
    var subviews: LayoutSubviews3D {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        assertUnimplemented()
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        assertUnimplemented()
    }
    
    func childDepthGeometries(at viewSize: ViewSize3D, origin: Size3D) -> [ViewDepthGeometry] {
        assertUnimplemented()
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func requiresTrueDepthLayout() -> Bool {
        assertUnimplemented()
    }
    
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        assertUnimplemented()
    }
}

protocol DefaultAlignmentFunction3D {
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? 
}
