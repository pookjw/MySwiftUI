internal import CoreGraphics
internal import Spatial

struct LayoutSubviews3D {
    var storage: LayoutSubviews
}

struct LayoutSubview3D {
    var base: LayoutSubview
    
    func depthThatFits(_ size: _ProposedSize3D) -> CGFloat {
        return base.proxy.depth(in: size)
    }
}

struct ViewLayoutEngine3D<L : Layout3D>: DefaultAlignmentFunction3D, LayoutEngine {
    private var base: ViewLayoutEngine<L>
    private var depthCache = Cache3<_ProposedSize3D, CGFloat>() // 0x24
    private var cachedDepthAlignmentSize = ViewSize3D.zero // 0x28
    private var cachedDepthAlignmentGeometry: [ViewDepthGeometry] = [] // 0x2c
    private var cachedDepthAlignment = Cache3<ObjectIdentifier, CGFloat?>() // 0x30
    
    func update(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        assertUnimplemented()
    }
    
    init(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        self.base = ViewLayoutEngine(layout: layout, context: context, children: children)
    }
    
    var subviews: LayoutSubviews3D {
        return LayoutSubviews3D(storage: self.base.subviews)
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        return self.base.sizeThatFits(proposedSize)
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        var depthCache = self.depthCache
        
        let result = depthCache.get(proposedSize) {
            return self.base.layout.depthThatFits(
                proposal: proposedSize,
                subviews: self.subviews,
                cache: &self.base.cache
            )
        }
        
        self.depthCache = depthCache
        return result
    }
    
    mutating func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        return self.base.childGeometries(at: viewSize, origin: origin)
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
