// 49D9DAADFF4E358BF2B81421BD17CDAA
internal import CoreGraphics
internal import Spatial
internal import AttributeGraph
private import _MySwiftUIShims

protocol Layout3D : Layout {
    static var depthProperties: LayoutDepthProperties { get }
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache)
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat?
}

extension Layout3D {
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    static var depthProperties : LayoutDepthProperties {
        return LayoutDepthProperties(stackOrientationIsDepth: false)
    }
    
    func updateLayoutComputer<T : StatefulRule>(rule: inout T, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) where T.Value == LayoutComputer {
        rule.update(
            modify: { (engine: inout ViewLayoutEngine3D<Self>) in
                // $s7SwiftUI8Layout3DPAAE20updateLayoutComputer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0E15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0eF0V5ValueRtd__lFyAA04ViewE8Engine3DVyxGzXEfU_TA
                engine.update(layout: self, context: layoutContext, children: children)
            },
            create: {
                // $s7SwiftUI8Layout3DPAAE20updateLayoutComputer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0E15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0eF0V5ValueRtd__lFAA04ViewE8Engine3DVyxGyXEfU0_TA
                return ViewLayoutEngine3D(layout: self, context: layoutContext, children: children)
            }
        )
    }
}

struct LayoutDepthProperties {
    private(set) var stackOrientationIsDepth: Bool
}

struct AnyLayoutDepthProperties : AsyncAttribute, Rule {
    @Attribute private(set) var layout: AnyLayout
    
    var value: Bool {
        assertUnimplemented()
    }
}

struct LayoutSubviews3D : Equatable, RandomAccessCollection {
    subscript(position: Int) -> LayoutSubview3D {
        return LayoutSubview3D(base: self.storage[position])
    }
    
    var storage: LayoutSubviews
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return self.storage.endIndex
    }
}

struct LayoutSubview3D : Equatable {
    var base: LayoutSubview
    
    func depthThatFits(_ size: _ProposedSize3D) -> CGFloat {
        return self.base.proxy.depth(in: size)
    }
    
    var priority: Double {
        return self.base.priority
    }
    
    func placeDepth(in geometry: ViewDepthGeometry) {
        let pointer = unsafe _threadLayoutData()!
            .assumingMemoryBound(to: PlacementData3D.self)
        
        unsafe pointer.pointee.geometry[Int(self.base.index)] = geometry
        
        if !geometry.isInvalid {
            unsafe pointer.pointee.validCount &+= 1
        }
    }
    
    func dimensions(in size: _ProposedSize3D) -> ViewDimensions3D {
        return self.base.proxy.dimensions3D(in: size)
    }
    
    func placeDepth(at depth: CGFloat, anchor: CGFloat, dimensions: ViewDimensions3D) {
        let d0 = depth
        let d1 = anchor
        let d10 = dimensions.size.value.depth
        var d2 = d1 * d10
        d2 = d0 - d2
        d2 = (d1 == 0) ? d0 : d2
        
        guard !d2.isNaN else {
            preconditionFailure("view originZ is invalid: \(d0), \(d1), \(dimensions.size.value)")
        }
        
        // <+64>
        // x29 - 0x70
        let copy_1 = self
        // sp + 0x40
        let size = dimensions.size
        // sp + 0x10
        let proposal = size.proposal
        
        copy_1.placeDepth(
            in: ViewDepthGeometry(
                origin: ViewDepthOrigin(d2),
                size: ViewDepth(dimensions.size.value.depth, proposal: proposal.depth)
            )
        )
    }
    
    func placeDepth(at depth: CGFloat, anchor: CGFloat, proposal: _ProposedSize3D) {
        assertUnimplemented()
    }
    
    func sizeThatFits(_ size: ProposedViewSize) -> CGSize {
        assertUnimplemented()
    }
    
    static func == (lhs: LayoutSubview3D, rhs: LayoutSubview3D) -> Bool {
        assertUnimplemented()
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
        return self.base.spacing()
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
        // x29 - 0x120
        let copy_3 = Rect3D(
            origin: Point3D(origin),
            size: copy_1.value
        )
        // x29 - 0x100
        let _ = copy_1
        // x29 - 0x160
        let copy_4 = viewSize
        // x29 - 0xe0
        let proposal = copy_4.proposal
        // x29 - 0x160
        let subviews = self.subviews
        
        return withUnsafeMutablePointer(to: &self) { pointer_1 in
            // $s7SwiftUI18ViewLayoutEngine3DV20childDepthGeometries2at6originSayAA0cG8GeometryVGAA0C6Size3DV_So9SPPoint3DatFAISpyAA0cD6EngineVyxGGXEfU_TA
            /*
             pointer -> x0 -> x19
             
             ViewLayoutEngine.self -> x10/x11 -> sp
             count -> x9 -> x1 -> x24
             copy_3 -> x2 -> x28
             proposal -> x3 -> x23
             subviews -> w4/x5/w6 -> w25/sp + 0x28/w27
             copy_1 -> x7 -> sp + 0x30
             */
            let layoutDirection = unsafe pointer_1.pointee.base.layoutDirection
            let geometries: [ViewDepthGeometry]
            
            if count == 0 {
                // <+200>
                geometries = []
                // <+388>
            } else {
                // <+128>
                geometries = Array<ViewDepthGeometry>(
                    repeating: ViewDepthGeometry(
                        origin: .invalidValue,
                        size: .invalidValue
                    ),
                    count: count
                )
                // <+388>
            }
            
            // <+388>
            // sp + 0x40
            var data = unsafe PlacementData3D(
                signature: .depthPlacement,
                geometry: geometries,
                validCount: 0,
                bounds: copy_3,
                layoutDirection: layoutDirection,
                layoutEngine: OpaquePointer(pointer_1),
                type: L.self
            )
            
            return withUnsafeMutablePointer(to: &data) { pointer_2 in
                // $s7SwiftUI18ViewLayoutEngine3DV20childDepthGeometries2at6originSayAA0cG8GeometryVGAA0C6Size3DV_So9SPPoint3DatFAISpyAA0cD6EngineVyxGGXEfU_ySpyAA15PlacementData3D33_49D9DAADFF4E358BF2B81421BD17CDAALLVGXEfU_
                /*
                 pointer_2 -> x0 -> x25
                 pointer_1 -> x1 -> x23
                 copy_3 -> x2 -> x19 + 0x10
                 proposal -> x3 -> x20
                 subviews -> w4/x5/w6 -> x19 + 0x98
                 count -> x7 -> x19 + 0x18
                 */
                // <+124>
                // x19 + 0x8
                let old = unsafe _threadLayoutData()
                unsafe _setThreadLayoutData(pointer_2)
                
                // x28
                let copy_5 = unsafe pointer_1.pointee.base.layout
                // x19 + 0xd0
                let copy_6 = proposal
                
                unsafe copy_5.placeSubviewDepths(
                    in: copy_3,
                    proposal: copy_6,
                    subviews: subviews,
                    cache: &pointer_1.pointee.base.cache
                )
                
                /*
                 pointer_1 -> x23 -> x26
                 count -> x19 + 0x18 -> x23
                 */
                unsafe _setThreadLayoutData(old)
                
                // <+300>
                if unsafe pointer_2.pointee.validCount != count {
                    for i in 0..<count {
                        // <+384>
                        guard unsafe pointer_2.pointee.geometry[i].isInvalid else {
                            continue
                        }
                        
                        // <+428>
                        let proxy = unsafe pointer_1.pointee.base.proxies[i]
                        // x19 + 0xd0 -> x19 + 0x40
                        let dimensions = proxy.dimensions3D(in: proposal)
                        
                        let origin: CGFloat
                        do {
                            let bounds = unsafe pointer_2.pointee.bounds
                            
                            var d0 = bounds.origin.x
                            var d1 = bounds.origin.y
                            var d2 = bounds.origin.z
                            var d3 = bounds.size.width
                            let d4 = bounds.size.height
                            let d5 = bounds.size.depth
                            
                            d3 = d3 * 0.5
                            d0 = d0 + d3
                            d3 = d4 * 0.5
                            d1 = d1 + d3
                            d3 = d5 * 0.5
                            d2 = d2 + d3
                            var d11 = Point3D(x: d0, y: d1, z: d2).z
                            
                            d0 = dimensions.size.value.depth * 0.5
                            d11 = d11 - d0
                            origin = d11
                        }
                        
                        unsafe pointer_2.pointee.geometry[i] = ViewDepthGeometry(
                            origin: origin,
                            dimensions: dimensions
                        )
                        
                        unsafe pointer_2.pointee.validCount &+= 1
                    }
                }
                
                return unsafe pointer_2.pointee.geometry
            }
        }
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return self.base.requiresTrueDepthLayout()
    }
    
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        assertUnimplemented()
    }
}

protocol DefaultAlignmentFunction3D {
    static func defaultAlignment(_ alignmentKey: DepthAlignmentKey, size: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? 
}

fileprivate struct PlacementData3D {
    private(set) var signature: DepthDataSignature // 0x0
    var geometry: [ViewDepthGeometry] // 0x8
    var validCount: Int // 0x10
    private(set) var bounds: Rect3D // 0x20
    private(set) var layoutDirection: LayoutDirection // 0x60
    private(set) var layoutEngine: OpaquePointer // 0x68
    private(set) var type: any Layout3D.Type // 0x70
}

enum DepthDataSignature {
    case depthPlacement
    case depthAlignment
}
