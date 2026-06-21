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
    
    mutating func childDepthGeometries(at viewSize: ViewSize3D, origin: Size3D) -> [ViewDepthGeometry] {
        /*
         self -> x20 -> x19
         viewSize -> x0 -> x20
         origin -> d0/d1/d2 -> d10/d9/d8
         */
        // x23 (x29 - 0xb0)
        let copy_1 = viewSize
        // x24
        let count = self.base.proxies.count
        // x29 - 0x120
        let copy_2 = viewSize
        
        if
            self.cachedDepthAlignmentSize == copy_2 &&
                origin == .zero &&
                self.cachedDepthAlignmentGeometry.count == count
        {
            return self.cachedDepthAlignmentGeometry
        }
        
        // <+240>
        // x29 - 0x100
        let copy_3 = copy_1
        // x29 - 0x160
        let copy_4 = viewSize
        // x29 - 0xe0
        let proposal = copy_4.proposal
        // x29 - 0x160
        let subviews = self.subviews
        
        return withUnsafeMutablePointer(to: &self) { pointer in
            // $s7SwiftUI18ViewLayoutEngine3DV20childDepthGeometries2at6originSayAA0cG8GeometryVGAA0C6Size3DV_So9SPPoint3DatFAISpyAA0cD6EngineVyxGGXEfU_TA
            /*
             pointer -> x0 -> x19
             
             ViewLayoutEngine.self -> x10/x11 -> sp
             count -> x9 -> x1 -> x24
             copy_2 -> x2 -> x28
             proposal -> x3 -> x23
             subviews -> w4/x5/w6 -> w4/sp + 0x28/w27
             copy_1 -> x7 -> sp + 0x30
             */
            let layoutDirection = pointer.pointee.base.layoutDirection
            let geometries: [ViewDepthGeometry]
            
            if count == 0 {
                // <+200>
                geometries = []
                // <+388>
            } else {
                // <+128>
                // layoutDirection -> sp + 0x24
                geometries = unsafe Array<ViewDepthGeometry>(unsafeUninitializedCapacity: count) { buffer, initializedCount in
                    initializedCount = count
                    
                    if count >= 8 {
                        // <+236>
                        assertUnimplemented()
                    } else {
                        // <+168>
                        assertUnimplemented()
                    }
                }
                
                assertUnimplemented()
            }
            
            // <+388>
            assertUnimplemented()
        }
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
