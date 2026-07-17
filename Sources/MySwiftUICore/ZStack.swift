// 8EE795473C30656CB19FF09054F439FA
public import CoreGraphics
internal import Spatial
internal import AttributeGraph

@frozen public struct ZStack<Content> : View where Content : View {
    @usableFromInline
    package var _tree: _VariadicView.Tree<_ZStackLayout, Content>
    
    @inlinable public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        _tree = .init(_ZStackLayout(alignment: alignment)) { content() }
    }
    
    nonisolated public static func _makeView(view: _GraphValue<ZStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        // sp + 0x20
        let copy_1 = inputs
        // view -> x0 -> x29 - 0x34
        // x29 - 0x38
        let tree = view[{ .of(&$0._tree) }]
        return _VariadicView.Tree<_ZStackLayout, Content>.makePlatformSubstitutableView(view: tree, inputs: copy_1)
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension ZStack : Sendable {
}

extension ZStack : UnaryView, PrimitiveView {}

@frozen public struct _ZStackLayout : _VariadicView.UnaryViewRoot, Animatable {
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView3D(root: root, inputs: inputs, body: body)
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _ZStackLayout : @preconcurrency Layout {
    public static var layoutProperties: LayoutProperties {
        var layoutProperties = LayoutProperties()
        layoutProperties.isDefaultEmptyLayout = true
        layoutProperties.isIdentityUnaryLayout = true
        return layoutProperties
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: _ZStackLayout.Subviews, cache: inout Void) {
        assertUnimplemented()
    }
    
    public func spacing(subviews: _ZStackLayout.Subviews, cache: inout Void) -> ViewSpacing {
        let priority = subviews
            .lazy
            .map { subview -> Double in
                // $s7SwiftUI13_ZStackLayoutV13placeSubviews2in8proposal8subviews5cacheySo6CGRectV_AA16ProposedViewSizeVAA0dF0VytztFSdAA0D7SubviewVcfU_
                return subview.proxy.layoutPriority
            }
            .max() ?? 0
        
        // <+152>
        for subview in subviews {
            if subview.proxy.layoutPriority == priority {
                // <+836>
                var spacing = Spacing(minima: [:])
                
                for subview in subviews {
                    if subview.proxy.layoutPriority == priority {
                        spacing.incorporate(.all, of: subview.proxy.spacing())
                    }
                }
                
                return ViewSpacing(spacing, layoutDirection: subviews.layoutDirection)
            }
        }
        
        return .zero
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: _ZStackLayout.Subviews, cache: inout Void) -> CGSize {
        assertUnimplemented()
    }
    
    public typealias Cache = Void
}

extension _ZStackLayout : BitwiseCopyable {}

extension _ZStackLayout : @preconcurrency Layout3D {
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Void) -> CGFloat {
        assertUnimplemented()
    }
    
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Void) {
        assertUnimplemented()
    }
}

extension _ZStackLayout : _VariadicView_ImplicitRoot {
    static var implicitRoot: _ZStackLayout {
        assertUnimplemented()
    }
}

extension _ZStackLayout : DerivedSpatialLayout {
    @_implements(SpatialLayout, layoutProperties)
    nonisolated static var spatialLayoutProperties: SpatialLayoutProperties {
        // s7SwiftUI13SpatialLayoutPAAE010makeStaticcD4View4root6inputs10properties4listAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAA0cD10PropertiesVAA01_G13List_Elements_ptFZAA07_ZStackD0V_Tt4B5에 inline으로 정의된 것으로 추정
        return SpatialLayoutProperties(value: 0x22)
    }
    
    nonisolated func makeCache(subviews: SpatialLayoutSubviews) -> ZStackSpatialLayout.Cache3D {
        return ZStackSpatialLayout.Cache3D(partialPlacements: Dictionary())
    }
    
    nonisolated func updateCache(_ cache: inout ZStackSpatialLayout.Cache3D, subviews: SpatialLayoutSubviews) {
        assertUnimplemented()
    }
    
    nonisolated func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> Size3D {
        let layout3D = ZStackLayout3D(alignment: self.alignment, spacing: nil)
        let layout = ZStackSpatialLayout(base: layout3D)
        return layout.volumeThatFits(proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    nonisolated func placeSubviews(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) {
        let layout = ZStackSpatialLayout(
            base: ZStackLayout3D(
                alignment: self.alignment,
                spacing: nil
            )
        )
        
        return layout.placeSubviews(in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    nonisolated func spacing(subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> ViewSpacing3D {
        var cache: () = Void()
        let spacing = self.spacing(subviews: subviews.subviews, cache: &cache)
        
        return ViewSpacing3D(
            spacing: Spacing3D(
                spacing2D: spacing.spacing,
                depthSpacing: Spacing3D.DepthSpacing(value: 0)
            )
        )
    }
    
    nonisolated func explicitAlignment(of guide: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    nonisolated func explicitAlignment(of guide: VerticalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    nonisolated static func _makeSpatialLayoutView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    typealias SpatialBase = _ZStackLayout
    typealias Cache3D = ZStackSpatialLayout.Cache3D
}

package protocol ZStackParameterSmuggler {
    static func makeParameterSmuggledZStackView<C : View>(view: _GraphValue<_VariadicView.Tree<_ZStackLayout, C>>, inputs: _ViewInputs) -> _ViewOutputs
}

struct EnableZStackTrueDepthLayout : UserDefaultKeyedFeature, ViewInputFlag {
    init() {}
    
    static var key: String {
        return "com.apple.SwiftUI.EnableZStackTrueDepthLayout"
    }
    
    @safe nonisolated(unsafe) static var cachedValue: Bool?
    @safe nonisolated(unsafe) static var defaultValue: Bool = true
}

struct ZStackSpatialLayout : SpatialLayout, Animatable {
    fileprivate private(set) var base: ZStackLayout3D
    
    static var layoutProperties: SpatialLayoutProperties {
        assertUnimplemented()
    }
    
    func makeCache(subviews: SpatialLayoutSubviews) -> Self.Cache3D {
        assertUnimplemented()
    }
    
    func updateCache(_ cache: inout Self.Cache3D, subviews: SpatialLayoutSubviews) {
        assertUnimplemented()
    }
    
    func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> Size3D {
        let placement = self.partialPlacement(proposal: proposal, subviews: subviews, cache: &cache)
        return placement.volume
    }
    
    func placeSubviews(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) {
        /*
         bounds -> x0 -> x22
         self.base.alignment.vertical -> sp + 0x38
         self.base.alignment.horizontal -> sp + 0x40
         */
        // x29 - 0xf0
        let proposal_2 = _ProposedSize3D(
            width: bounds.size.width,
            height: bounds.size.height,
            depth: proposal.depth
        )
        // sp + 0xa0
        let copy_1 = subviews
        // x23
        let placement = self.partialPlacement(proposal: proposal_2, subviews: copy_1, cache: &cache)
        // d9
        let priority = subviews
            .subviews
            .lazy
            .map { subview -> Double in
                // $s7SwiftUI19ZStackSpatialLayoutV13placeSubviews2in8proposal8subviews5cacheySo8SPRect3Da_AA15_ProposedSize3DVAA0deG0VAC7Cache3DVztFSdAA0dE7SubviewVcfU_
                return subview.proxy.layoutPriority
            }
            .max() ?? 0
        
        // <+256>
        var d10 = -CGFloat.infinity
        var d11 = d10
        
        for child in placement.children {
            guard child.priority == priority else {
                continue
            }
            
            let horizontal = child.dimensions[self.base.alignment.horizontal.key]
            d11 = (d11 <= horizontal) ? horizontal : d11
            let vertical = child.dimensions[self.base.alignment.vertical.key]
            d10 = (d10 <= vertical) ? vertical : d10
        }
        
        // <+564>
        for (index, subview) in subviews.subviews.enumerated() {
            // <+916>
            let child = placement.children[index]
            
            let d8: CGFloat
            if let horizontal = child.dimensions[explicit: self.base.alignment.horizontal.key] {
                d8 = horizontal
            } else {
                // <+1040>
                let proposal = child.dimensions.size.proposal
                
                let dimensions = ViewDimensions(
                    guideComputer: child.dimensions.guideComputer,
                    size: CGSize(
                        width: child.dimensions.size.value.width,
                        height: child.dimensions.size.value.height
                    ),
                    proposal: _ProposedSize(width: proposal.width, height: proposal.height)
                )
                
                d8 = self.base.alignment.horizontal.key.id.defaultValue(in: dimensions)
            }
            
            // <+1272>
            let d9: CGFloat
            if let vertical = child.dimensions[explicit: self.base.alignment.vertical.key] {
                d9 = vertical
            } else {
                // <+1040>
                let proposal = child.dimensions.size.proposal
                
                let dimensions = ViewDimensions(
                    guideComputer: child.dimensions.guideComputer,
                    size: CGSize(
                        width: child.dimensions.size.value.width,
                        height: child.dimensions.size.value.height
                    ),
                    proposal: _ProposedSize(width: proposal.width, height: proposal.height)
                )
                
                d9 = self.base.alignment.vertical.key.id.defaultValue(in: dimensions)
            }
            
            // <+752>
            var d0 = bounds.origin.x
            var d1 = bounds.origin.y
            var d2 = d11 - d8
            let d3 = d2 + d0
            d2 = d10 - d9
            let d4 = d2 + d1
            d2 = child.depthPlacement
            d0 = (d11 == d8) ? d0 : d3
            d1 = (d10 == d9) ? d1 : d4
            
            let spatialSubview = SpatialLayoutSubview(subview: subview)
            
            spatialSubview.place(
                at: Point3D(x: d0, y: d1, z: d2),
                anchor: UnitPoint3D(x: 0, y: 0, z: 0),
                dimensions: child.dimensions
            )
        }
    }
    
    func spacing(subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> ViewSpacing3D {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: VerticalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func _makeSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeDynamicSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeStaticSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: _ViewList_Elements) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    fileprivate func partialPlacement(
        proposal: _ProposedSize3D,
        subviews: SpatialLayoutSubviews,
        cache: inout ZStackSpatialLayout.Cache3D
    ) -> ZStackSpatialLayout.PartialPlacement {
        /*
         proposal -> x0
         subviews -> x1
         cache -> x2 -> x19
         base.alignment -> x3/x4 -> sp + 0x48 / sp + 0x40
         base.spacing -> x5/w6 -> x27/w28
         */
        struct Item {
            var index: Int // 0x0
            var proxy: SpatialLayoutSubview // 0x8
            var priority: Double // 0x20
            var minDepth: CGFloat // 0x28
        }
        
        // sp + 0x1f0
        let copy_1 = proposal
        // sp + 0x60
        let _ = subviews
        
        if let cached = cache.partialPlacements[proposal] {
            return cached
        }
        
        // <+172>
        guard !subviews.subviews.isEmpty else {
            return ZStackSpatialLayout.PartialPlacement(children: [], volume: .zero)
        }
        
        // x22
        let count = subviews.subviews.count
        let d14 = self.base.spacing ?? defaultSpacing3DValue.depth
        
        // sp + 0x80
        let priority = subviews
            .subviews
            .lazy
            .map { subview -> Double in
                // $s7SwiftUI13_ZStackLayoutV13placeSubviews2in8proposal8subviews5cacheySo6CGRectV_AA16ProposedViewSizeVAA0dF0VytztFSdAA0D7SubviewVcfU_
                return subview.proxy.layoutPriority
            }
            .max() ?? 0
        
        var d9 = d14 * CGFloat(subviews.subviews.count &- 1)
        /*
         unknown0 -> sp + 0x68
         unknown1 -> sp + 0x78
         unknown2 -> d15
         unknown3 -> sp + 0x70
         */
        var extents = ZStackSpatialLayout.PlanarExtents.invalidValue
        var d15 = extents.unknown2
        var d8 = Size3D(width: 0, height: 0, depth: d9).depth
        var x26 = d8
        
        // <+528>
        if var d8 = copy_1.depth {
            // <+2240>
            var x290xd0 = proposal
            x290xd0.depth = 0
            var x290x100 = proposal
            x290x100.depth = .infinity
            
            // x23
            let items = subviews
                .subviews
                .enumerated()
                .map { (index, subview) -> Item in
                    return Item(
                        index: index,
                        proxy: SpatialLayoutSubview(subview: subview),
                        priority: subview.priority,
                        minDepth: subview.proxy.depth(in: x290xd0)
                    )
                }
                .sorted { lhs, rhs in
                    if lhs.priority < rhs.priority {
                        return false
                    } else if rhs.priority < lhs.priority {
                        return true
                    }
                    
                    // <+276>
                    let d0 = lhs.proxy.subview.proxy.depth(in: x290x100) - lhs.minDepth
                    let d1 = rhs.proxy.subview.proxy.depth(in: x290x100) - rhs.minDepth
                    
                    // <+1376>
                    if d0 < d1 {
                        return true
                    } else if (d1 < d0) || (lhs.index >= rhs.index) {
                        return false
                    } else {
                        return true
                    }
                }
            
            // x21
            var children = Array(
                repeating: ZStackSpatialLayout
                    .PartialPlacement
                    .Child(
                        dimensions: .invalidValue,
                        depthPlacement: 0,
                        priority: -1
                    ),
                count: count
            )
            
            // <+2476>
            var d0: CGFloat = items.reduce(0) { partialResult, item in
                return item.minDepth + partialResult
            }
            
            // <+3084>
            if !(count < 1) {
                d0 = d9 + d0
                d0 = d8 - d0
                let sp0x20 = d14
                
                var i = 0
                var flag = true
                var priority_2: Double!
                var x14: Int!
                var x9: Int!
                var d1: CGFloat!
                var sp0x60: CGFloat!
                var d14: CGFloat!
                
                while true {
                    if flag {
                        // <+3180>
                        // sp + 0x88
                        priority_2 = items[i].priority
                        x14 = i
                        for i2 in i..<count {
                            // <+3240>
                            let p2 = items[i2].priority
                            if priority_2 != p2 {
                                // <+3280>
                                break
                            }
                            x14 &+= 1
                            if count != x14 {
                                // <+3240>
                                continue
                            } else {
                                // <+3276>
                                x14 = count
                                // <+3280>
                                break
                            }
                        } 
                        
                        // <+3280>
                        if i == x14 {
                            // <+3168>
                            i = x14
                            if x14 >= count {
                                break
                            } else {
                                // <+3180>
                                continue
                            }
                        }
                        
                        // <+3288>
                        sp0x60 = d15
                        x9 = x14 &- i
                        d1 = items[i].minDepth
                        d15 = d0 + d1
                        d14 = x26
                    }
                    
                    // <+3340>
                    let item = items[i]
                    i &+= 1
                    
                    // <+3356>
                    d0 = CGFloat(x9)
                    d0 = d15 / d0
                    d1 = 0
                    var d11: CGFloat = (d0 >= 0) ? d0 : d1
                    
                    // x26, x27, x24
                    let volume = item.proxy.subview.proxy.volume(
                        in: _ProposedSize3D(
                            width: proposal.width,
                            height: proposal.height,
                            depth: d11
                        )
                    )
                    let d10 = volume.width
                    d9 = volume.height
                    d8 = volume.depth
                    x26 = d10
                    
                    // <+3556>
                    // sp + 0x150
                    let dimensions = ViewDimensions3D(
                        guideComputer: item.proxy.subview.proxy.layoutComputer,
                        size: volume,
                        proposal: _ProposedSize3D(
                            width: proposal.width,
                            height: proposal.height,
                            depth: d11
                        )
                    )
                    
                    children[item.index].dimensions = dimensions
                    d1 = priority
                    d0 = priority_2
                    children[item.index].priority = d0
                    d0 = item.priority
                    
                    // <+3896>
                    if d0 != d1 {
                        // <+4032>
                        // <+4236>
                    } else {
                        d11 = dimensions[self.base.alignment.horizontal.key]
                        var d12 = dimensions[self.base.alignment.vertical.key]
                        
                        // <+3992>
                        d0 = .infinity
                        
                        if d10 != d0 {
                            // <+4052>
                            d0 = .infinity
                            if d9 != d0 {
                                // <+4148>
                                d0 = d12
                                d1 = d11
                                // <+4156>
                                var d2 = extents.unknown0
                                d11 = (d2 <= d11) ? d11 : d2
                                // <+4176>
                                extents.unknown0 = d11
                                d2 = extents.unknown1
                                d12 = (d2 <= d12) ? d12 : d2
                                d11 = d1
                                // <+4196>
                                d1 = d10 - d11
                                d2 = sp0x60
                                d2 = (d2 <= d1) ? d1 : d2
                                sp0x60 = d2
                                d0 = d9 - d0
                                d1 = extents.unknown3
                                d1 = (d1 <= d0) ? d0 : d1
                                extents.unknown3 = d1
                                extents.unknown1 = d12
                                // <+4236>
                            } else {
                                // <+4064>
                                d0 = 0
                                d1 = extents.unknown0
                                
                                if d1 <= d11 {
                                    // <+4276>
                                    d1 = d11
                                    // <+4176>
                                    extents.unknown0 = d11
                                    var d2 = extents.unknown1
                                    d12 = (d2 <= d12) ? d12 : d2
                                    d11 = d1
                                    // <+4196>
                                    d1 = d10 - d11
                                    d2 = sp0x60
                                    d2 = (d2 <= d1) ? d1 : d2
                                    sp0x60 = d2
                                    d0 = d9 - d0
                                    d1 = extents.unknown3
                                    d1 = (d1 <= d0) ? d0 : d1
                                    extents.unknown3 = d1
                                    extents.unknown1 = d12
                                    // <+4236>
                                } else {
                                    d1 = extents.unknown1
                                    
                                    if d1 <= d12 {
                                        // <+4288>
                                        // <+4196>
                                        d1 = d10 - d11
                                        var d2: CGFloat = sp0x60
                                        d2 = (d2 <= d1) ? d1 : d2
                                        sp0x60 = d2
                                        d0 = d9 - d0
                                        d1 = extents.unknown3
                                        d1 = (d1 <= d0) ? d0 : d1
                                        extents.unknown3 = d1
                                        extents.unknown1 = d12
                                        // <+4236>
                                    } else {
                                        // <+4096>
                                        d0 = d10 - d11
                                        d1 = .infinity
                                        var d2 = extents.unknown3
                                        d2 = (d2 <= d1) ? d1 : d2
                                        extents.unknown3 = d2
                                        d1 = sp0x60
                                        d1 = (d1 <= d0) ? d0 : d1
                                        sp0x60 = d1
                                        // <+4044>
                                        // <+4236>
                                    }
                                }
                            }
                            
                            // <+4236>
                        } else {
                            // <+4008>
                            d1 = 0
                            d0 = .infinity
                            
                            if d9 != d0 {
                                // <+4140>
                                d0 = d12
                                // <+4156>
                            } else {
                                d0 = 0
                                // <+4156>
                            }
                            
                            // <+4156>
                            var d2 = extents.unknown0
                            d11 = (d2 <= d11) ? d11 : d2
                            // <+4176>
                            extents.unknown0 = d11
                            d2 = extents.unknown1
                            d12 = (d2 <= d12) ? d12 : d2
                            d11 = d1
                            // <+4196>
                            d1 = d10 - d11
                            d2 = sp0x60
                            d2 = (d2 <= d1) ? d1 : d2
                            sp0x60 = d2
                            d0 = d9 - d0
                            d1 = extents.unknown3
                            d1 = (d1 <= d0) ? d0 : d1
                            extents.unknown3 = d1
                            extents.unknown1 = d12
                            // <+4236>
                        }
                        
                        // <+4236>
                    }
                    
                    // <+4236>
                    d14 = d14 + d8
                    d0 = d15 - d8
                    
                    if x14 == i {
                        flag = true
                        // <+3144>
                        x26 = d14
                        d14 = sp0x20
                        d15 = sp0x60
                        // <+3168>
                        i = x14
                        if x14 >= count {
                            break
                        } else {
                            // <+3180>
                            continue
                        }
                    } else {
                        // <+4252>
                        d1 = items[i].minDepth
                        d15 = d0 + d1
                        flag = false
                        // <+3340> (<+3356>)
                    }
                }
            }
            
            // <+4312>
            if !children.isEmpty {
                d8 = -d14
                
                for index in children.indices {
                    d0 = d14 + d8
                    children[index].depthPlacement = d0
                    let d1 = children[index].dimensions.size.depth
                    d8 = d0 + d1
                }
            }
            
            // <+4412>
            var d1 = extents.unknown0
            d0 = extents.unknown3
            d8 = d15 + d1
            d1 = extents.unknown1
            d9 = d0 + d1
            let d10 = x26
            d0 = d8
            d1 = d9
            let d2 = d10
            
            let placement = ZStackSpatialLayout.PartialPlacement(
                children: children,
                volume: Size3D(width: d0, height: d1, depth: d2)
            )
            
            cache.partialPlacements[proposal] = placement
            return placement
        } else {
            // <+540>
            // x21
            var children: [ZStackSpatialLayout.PartialPlacement.Child] = []
            
            if !subviews.subviews.isEmpty {
                // <+556>
                var d11 = -d14
                let d12: CGFloat = 0
                
                for subview in subviews.subviews {
                    // <+624>
                    // sp + 0x1a0 -> sp + 0x220
                    let dimensions = subview.proxy.dimensions3D(in: proposal)
                    var d9 = subview.priority
                    var d0 = priority
                    
                    if d9 != d0 {
                        // <+1696>
                    } else {
                        // <+980>
                        if let value = dimensions[explicit: self.base.alignment.horizontal.key] {
                            d9 = value
                            // <+1292>
                        } else {
                            // <+1028>
                            d9 = self.base.alignment.horizontal.key.id.defaultValue(in: ViewDimensions(dimensions))
                            // <+1292>
                        }
                        
                        // <+1292>
                        let d10: CGFloat
                        if let value = dimensions[explicit: self.base.alignment.vertical.key] {
                            d10 = value
                            // <+1600>
                        } else {
                            // <+1340>
                            d10 = self.base.alignment.vertical.key.id.defaultValue(in: ViewDimensions(dimensions))
                            // <+1600>
                        }
                        
                        // <+1600>
                        d0 = dimensions.size.value.width
                        var d1 = dimensions.size.value.height
                        var d2 = CGFloat.infinity
                        let d3 = (d1 == d2) ? d12 : d10
                        d2 = (d0 == d2) ? d12 : d9
                        d2 = d0 - d2
                        d0 = d1 - d3
                        d1 = extents.unknown0
                        d1 = (d1 <= d9) ? d9 : d1
                        extents.unknown0 = d1
                        d1 = extents.unknown1
                        d1 = (d1 <= d10) ? d10 : d1
                        extents.unknown1 = d1
                        d15 = (d15 <= d2) ? d2 : d15
                        d1 = extents.unknown3
                        
                        if d1 <= d0 {
                            extents.unknown3 = d0
                        }
                        
                        // <+1696>
                    }
                    
                    // <+1696>
                    d9 = subview.priority
                    let d10 = d14 + d11
                    
                    let child = ZStackSpatialLayout.PartialPlacement.Child(
                        dimensions: dimensions,
                        depthPlacement: d10,
                        priority: d9
                    )
                    
                    children.append(child)
                    
                    // <+2020>
                    d0 = dimensions.size.value.depth
                    d8 = d8 + d0
                    d11 = d10 + d0
                }
                
                x26 = d8
                // <+2876>
            }
            
            // <+2876>
            var d1 = extents.unknown0
            let d0 = extents.unknown3
            let d8 = d15 + d1
            d1 = extents.unknown1
            d9 = d0 + d1
            let d10 = x26
            
            let placement = ZStackSpatialLayout.PartialPlacement(
                children: children,
                volume: Size3D(width: d8, height: d9, depth: d10)
            )
            
            cache.partialPlacements[proposal] = placement
            return placement
        }
    }
}

extension ZStackSpatialLayout {
    struct Cache3D {
        fileprivate var partialPlacements: [_ProposedSize3D: ZStackSpatialLayout.PartialPlacement]
    }
    
    struct PartialPlacement {
        fileprivate private(set) var children: [ZStackSpatialLayout.PartialPlacement.Child]
        fileprivate private(set) var volume: Size3D
    }
    
    struct PlanarExtents {
        static let invalidValue = ZStackSpatialLayout.PlanarExtents(
            unknown0: -.infinity,
            unknown1: -.infinity,
            unknown2: -.infinity,
            unknown3: -.infinity
        )
        
        fileprivate var unknown0: CGFloat
        fileprivate var unknown1: CGFloat
        fileprivate let unknown2: CGFloat
        fileprivate var unknown3: CGFloat
    }
}

extension ZStackSpatialLayout.PartialPlacement {
    struct Child {
        fileprivate var dimensions: ViewDimensions3D // 0x0
        fileprivate var depthPlacement: CGFloat // 0x50
        fileprivate var priority: Double // 0x58
    }
}

struct ZStackLayout3D {
    fileprivate private(set) var alignment: Alignment
    fileprivate private(set) var spacing: CGFloat?
    
    init(alignment: Alignment, spacing: CGFloat?) {
        self.alignment = alignment
        self.spacing = spacing
    }
}

extension ZStackLayout3D : Layout3D {
    static var depthProperties: LayoutDepthProperties {
        return LayoutDepthProperties(stackOrientationIsDepth: true)
    }
    
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat {
        assertUnimplemented()
    }
    
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) {
        assertUnimplemented()
    }
    
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
}

extension ZStackLayout3D : DerivedSpatialLayout {
    typealias SpatialBase = ZStackSpatialLayout
    typealias Cache3D = ZStackSpatialLayout.Cache3D
    
    static var layoutProperties: SpatialLayoutProperties {
        assertUnimplemented()
    }
    
    func makeCache(subviews: SpatialLayoutSubviews) -> Self.Cache3D {
        assertUnimplemented()
    }
    
    func updateCache(_ cache: inout Self.Cache3D, subviews: SpatialLayoutSubviews) {
        assertUnimplemented()
    }
    
    func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> Size3D {
        assertUnimplemented()
    }
    
    func placeSubviews(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) {
        assertUnimplemented()
    }
    
    func spacing(subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> ViewSpacing3D {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: VerticalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func _makeSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeDynamicSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeStaticSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: _ViewList_Elements) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension ZStackLayout3D : _VariadicView_UnaryViewRoot {
    
}

extension ZStackLayout3D : Layout {
    typealias Cache = Void
    
    func makeCache(subviews: Self.Subviews) -> Self.Cache {
        assertUnimplemented()
    }
    
    func updateCache(_ cache: inout Self.Cache, subviews: Self.Subviews) {
        assertUnimplemented()
    }
    
    func spacing(subviews: Self.Subviews, cache: inout Self.Cache) -> ViewSpacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGSize {
        assertUnimplemented()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

struct StaticSpatialLayoutComputer<L : SpatialLayout> : StatefulRule {
    @Attribute var layout: L
    @Attribute var environment: EnvironmentValues
    var childAttributes: [LayoutProxyAttributes]
    
    typealias Value = LayoutComputer
    
    mutating func updateValue() {
        self.updateSpatialLayoutComputer(
            layout: self.layout,
            environment: self.$environment,
            attributes: self.childAttributes
        )
    }
}
