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
        return ZStackSpatialLayout.Cache3D(partialPlacements: [:])
    }
    
    nonisolated func updateCache(_ cache: inout ZStackSpatialLayout.Cache3D, subviews: SpatialLayoutSubviews) {
        assertUnimplemented()
    }
    
    nonisolated func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> Size3D {
        assertUnimplemented()
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

struct ZStackSpatialLayout {
    var base: ZStackLayout3D
}

extension ZStackSpatialLayout {
    struct Cache3D {
        fileprivate private(set) var partialPlacements: [_ProposedSize3D: ZStackSpatialLayout.PartialPlacement]
    }
    
    struct PartialPlacement {
        private var children: [ZStackSpatialLayout.PartialPlacement.Child]
        private var volume: Size3D
    }
}

extension ZStackSpatialLayout.PartialPlacement {
    struct Child {
        private var dimensions: ViewDimensions3D
        private var depthPlacement: CGFloat
        private var priority: Double
    }
}

struct ZStackLayout3D {
    // TODO
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
