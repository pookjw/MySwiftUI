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
        assertUnimplemented()
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
    
    nonisolated func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> CGFloat? {
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
    
    // $s7SwiftUI19ZStackSpatialLayoutV16partialPlacement33_8EE795473C30656CB19FF09054F439FALL8proposal8subviews5cacheAC07PartialG0VAA15_ProposedSize3DV_AA0dE8SubviewsVAC7Cache3DVztF
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
        let copy_2 = subviews
        
        if let cached = cache.partialPlacements[proposal] {
            return cached
        }
        
        // <+172>
        guard !subviews.subviews.isEmpty else {
            return ZStackSpatialLayout.PartialPlacement(children: [], volume: .zero)
        }
        
        // x22
        let count = subviews.subviews.count
        let d14 = self.base.spacing ?? 0
        
        // sp + 0x80
        let priority = subviews
            .subviews
            .lazy
            .map { subview -> Double in
                // $s7SwiftUI13_ZStackLayoutV13placeSubviews2in8proposal8subviews5cacheySo6CGRectV_AA16ProposedViewSizeVAA0dF0VytztFSdAA0D7SubviewVcfU_
                return subview.proxy.layoutPriority
            }
            .max() ?? 0
        
        let d9 = d14 * CGFloat(subviews.subviews.count &- 1)
        // sp + 0x68 / d15 (값 순서 다름)
        let invalidValue = ZStackSpatialLayout.PlanarExtents.invalidValue
        // x26
        let depth_1 = Size3D(width: 0, height: 0, depth: d9).depth
        
        // <+528>
        if let d8 = copy_1.depth {
            // <+2240>
            // x23
            let items = subviews
                .subviews
                .enumerated()
                .map { (index, subview) -> Item in
                    return Item(
                        index: index,
                        proxy: SpatialLayoutSubview(subview: subview),
                        priority: subview.priority,
                        minDepth: subview.proxy.depth(in: proposal)
                    )
                }
                .sorted { lhs, rhs in
                    if lhs.priority < rhs.priority {
                        return false
                    } else if rhs.priority < lhs.priority {
                        return true
                    }
                    
                    // <+276>
                    let d0 = rhs.proxy.subview.proxy.depth(in: proposal) - rhs.minDepth
                    let d1 = lhs.proxy.subview.proxy.depth(in: proposal) - lhs.minDepth
                    
                    if d0 < d1 {
                        return false
                    } else if (d1 < d0) && (rhs.index < lhs.index) {
                        return true
                    } else {
                        return false
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
                d0 = d9 - d0
                d0 = d8 - d0
                
                var i = 0
                while true {
                    // <+3180>
                    // sp + 0x88
                    let priority_2 = items[i].priority
                    var x14 = i
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
                    let x9 = x14 &- i
                    var d1 = items[i].minDepth
                    let d15 = d0 + d1
                    let d14 = depth_1
                    
                    // <+3340>
                    let item = items[i]
                    i &+= 1
                    d0 = CGFloat(x9)
                    d0 = d15 / d0
                    d1 = 1
                    let d11 = (d0 >= 0) ? d0 : d1
                    
                    // x26, x27, x24
                    let volume = item.proxy.subview.proxy.volume(
                        in: _ProposedSize3D(
                            width: proposal.width,
                            height: proposal.height,
                            depth: d11
                        )
                    )
                    
                    // <+3556>
                    // sp + 0x150
                    let dimensions = item.proxy.subview.proxy.dimensions3D(
                        in: _ProposedSize3D(
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
                    assertUnimplemented()
                }
            }
            
            // <+4312>
            assertUnimplemented()
        } else {
            // <+540>
            assertUnimplemented()
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
        
        let unknown0: CGFloat
        let unknown1: CGFloat
        let unknown2: CGFloat
        let unknown3: CGFloat
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
    private var alignment: Alignment
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
