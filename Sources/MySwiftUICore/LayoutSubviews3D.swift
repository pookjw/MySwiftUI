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
        fatalError("TODO")
    }
    
    init(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        fatalError("TODO")
    }
    
    var subviews: LayoutSubviews3D {
        fatalError("TODO")
    }
    
    func spacing() -> Spacing {
        fatalError("TODO")
    }
    
    func layoutPriority() -> Double {
        fatalError("TODO")
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        fatalError("TODO")
    }
    
    func childDepthGeometries(at viewSize: ViewSize3D, origin: Size3D) -> [ViewDepthGeometry] {
        fatalError("TODO")
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
    
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        fatalError("TODO")
    }
}

protocol DefaultAlignmentFunction3D {
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? 
}
