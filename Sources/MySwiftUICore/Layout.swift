// E479C0E92CDD045BAF2EF653123E2E0B

public import CoreGraphics
internal import AttributeGraph

@preconcurrency public protocol Layout: Sendable, Animatable {
    static var layoutProperties: LayoutProperties { get }
    
    associatedtype Cache = Void
    typealias Subviews = LayoutSubviews
    
    func makeCache(subviews: Self.Subviews) -> Self.Cache
    func updateCache(_ cache: inout Self.Cache, subviews: Self.Subviews)
    func spacing(subviews: Self.Subviews, cache: inout Self.Cache) -> ViewSpacing
    func sizeThatFits(proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGSize
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache)
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat?
    func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat?
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs
} 

extension Layout {
    public static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView(root: root, inputs: inputs, body: body)
    }
}

extension Layout {
    public static var layoutProperties: LayoutProperties {
        fatalError("TODO")
    }
    
    public func updateCache(_ cache: inout Self.Cache, subviews: Self.Subviews) {
        fatalError("TODO")
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public func spacing(subviews: Self.Subviews, cache: inout Self.Cache) -> ViewSpacing {
        fatalError("TODO")
    }
}

extension Layout where Self.Cache == () {
    public func makeCache(subviews: Self.Subviews) -> Self.Cache {
        fatalError("TODO")
    }
}

extension Layout {
    @_alwaysEmitIntoClient @_disfavoredOverload public func callAsFunction<V>(@ViewBuilder _ content: () -> V) -> some View where V : View {
        //        return _VariadicView.Tree(_LayoutRoot(self)) { content() }
        fatalError("TODO")
    }
}

extension Layout {
    public static func makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        // $s7SwiftUI6LayoutPAAE04makeC4View4root6inputs4bodyAA01_E7OutputsVAA11_GraphValueVyxG_AA01_E6InputsVAA01_e4ListI0VAA01_J0V_ANtXEtFZ
        // sp + 0x44
        var root = root
        // sp + 0x380
        let copy_1 = inputs
        // sp + 0x320
        var copy_2 = inputs
        // sp + 0x2c0
        var copy_3 = copy_1
        
        Self._makeAnimatable(value: &root, inputs: copy_2.base)
        
        // sp + 0x3e0
        let _ = copy_2
        
        // <+196>
        // w24
        var options = copy_1.base.options
        /*
         copy_1.base.customInputs -> x27
         */
        
        // w19/w28/sp + 0xc
        let layoutProperties: LayoutProperties
        if self != AnyLayout.self {
            // <+252>
            copy_3 = copy_1
            layoutProperties = Self.layoutProperties
            
            // w19
            if let stackOrientation = layoutProperties.stackOrientation {
                // <+548>
                options.remove([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
                switch stackOrientation {
                case .horizontal:
                    options.formUnion(.viewStackOrientationIsDefined)
                case .vertical:
                    options.formUnion([.viewStackOrientationIsDefined, .viewStackOrientationIsHorizontal])
                }
                copy_2.base.options = options
                // <+572>
            } else {
                // <+316>
                options.remove([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
                copy_2.base.options = options
                copy_2[DynamicStackOrientation.self] = OptionalAttribute()
                // <+572>
            }
        } else {
            // <+372>
            options.remove([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
            copy_2.base.options = options
            copy_3 = copy_1
            let rule = AnyLayoutProperties(layout: root.value.identifier.unsafeCast(to: AnyLayout.self))
            let attribute = Attribute(rule)
            copy_2[DynamicStackOrientation.self] = OptionalAttribute(attribute)
            layoutProperties = LayoutProperties()
            // <+572>
        }
        
        // <+572>
        let archivedViewInput = copy_3[ArchivedViewInput.self]
        if archivedViewInput.flags.contains(.isArchived) {
            // <+1260>
            var options = _ViewListInputs.Options(rawValue: copy_2[ViewListOptionsInput.self])
            options.formUnion(.needsArchivedAnimationTraits)
            copy_2[ViewListOptionsInput.self] = options.rawValue
        }
        
        // <+620>
        if !options.contains(.needsDynamicLayout) {
            copy_2.base.options = options
        }
        
        // <+628>
        // sp + 0x260
        let copy_4 = copy_2
        // sp + 0x1c0
        let copy_5 = copy_2
        copy_3 = copy_4
        // sp + 0x218
        let listOutputs = body(_Graph(), copy_5)
        copy_3 = copy_4
        // sp + 0x190
        let views = listOutputs.views
        // <+756>
        switch views {
        case .staticList(_):
            // <+1076>
            fatalError("TODO")
        case .dynamicList(var attribute, let listModifier):
            // <+764>
            /*
             attribute = w20
             listModifier = x21
             */
            if let listModifier {
                attribute = Attribute(_ViewListOutputs.ApplyModifiers(base: attribute, modifier: listModifier))
            }
            
            // <+892>
            // sp + 0x130
            let copy_6 = copy_2
            // sp + 0xd0
            let copy_7 = copy_2
            // sp + 0x1c0
            _ = copy_6
            
            let outputs = Self.makeDynamicView(root: root, inputs: copy_7, properties: layoutProperties, list: attribute)
            return outputs
        }
    }
}

@usableFromInline
package struct LayoutPriorityTraitKey: _ViewTraitKey {
    @inlinable package static var defaultValue: Double {
        get { 0.0 }
    }
    
    @usableFromInline
    package typealias Value = Double
}

@available(*, unavailable)
extension LayoutPriorityTraitKey: Sendable {
}

public struct LayoutProperties: Sendable {
    public init() {
        stackOrientation = nil
        isDefaultEmptyLayout = false
        isIdentityUnaryLayout = false
    }
    
    public var stackOrientation: Axis?
    private var isDefaultEmptyLayout: Bool
    private var isIdentityUnaryLayout: Bool
}

public struct LayoutSubviews: Equatable, RandomAccessCollection, Sendable {
    public typealias SubSequence = LayoutSubviews
    public typealias Element = LayoutSubview
    public typealias Index = Int
    
    public var layoutDirection: LayoutDirection {
        fatalError("TODO")
    }
    
    public var startIndex: Int {
        fatalError("TODO")
    }
    
    public var endIndex: Int {
        fatalError("TODO")
    }
    
    public subscript(index: Int) -> LayoutSubviews.Element {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript(bounds: Range<Int>) -> LayoutSubviews {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript<S>(indices: S) -> LayoutSubviews where S : Sequence, S.Element == Int {
        get {
            fatalError("TODO")
        }
    }
    
    public static func == (lhs: LayoutSubviews, rhs: LayoutSubviews) -> Bool {
        fatalError("TODO")
    }
    
    public typealias Indices = Range<LayoutSubviews.Index>
    public typealias Iterator = IndexingIterator<LayoutSubviews>
}

public struct LayoutSubview : Equatable {
    public func _trait<K>(key: K.Type) -> K.Value where K : _ViewTraitKey {
        fatalError("TODO")
    }
    
    public subscript<K>(key: K.Type) -> K.Value where K : LayoutValueKey {
        get {
            fatalError("TODO")
        }
    }
    
    public var priority: Double {
        get {
            fatalError("TODO")
        }
    }
    
    public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        fatalError("TODO")
    }
    
    public func dimensions(in proposal: ProposedViewSize) -> ViewDimensions {
        fatalError("TODO")
    }
    
    public var spacing: ViewSpacing {
        get {
            fatalError("TODO")
        }
    }
    
    public func place(at position: CGPoint, anchor: UnitPoint = .topLeading, proposal: ProposedViewSize) {
        fatalError("TODO")
    }
    
    public static func == (a: LayoutSubview, b: LayoutSubview) -> Bool {
        fatalError("TODO")
    }
}

public protocol LayoutValueKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}

@available(*, unavailable)
extension LayoutSubview : Sendable {
}

@frozen public struct AnyLayout: Layout, Sendable {
    var storage: AnyLayoutBox
    
    public init<L>(_ layout: L) where L : Layout {
        fatalError("TODO")
    }
    
    public struct Cache: Sendable {
    }
    
    public typealias AnimatableData = _AnyAnimatableData
    
    public func makeCache(subviews: AnyLayout.Subviews) -> AnyLayout.Cache {
        fatalError("TODO")
    }
    
    public func updateCache(_ cache: inout AnyLayout.Cache, subviews: AnyLayout.Subviews) {
        fatalError("TODO")
    }
    
    public func spacing(subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> ViewSpacing {
        fatalError("TODO")
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGSize {
        fatalError("TODO")
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) {
        fatalError("TODO")
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: AnyLayout.Subviews, cache: inout AnyLayout.Cache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public var animatableData: AnyLayout.AnimatableData {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

@usableFromInline class AnyLayoutBox: @unchecked Sendable {
    @usableFromInline deinit {}
}

@frozen public struct _VStackLayout {
    public var alignment: HorizontalAlignment
    public var spacing: CGFloat?
    
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
}

extension _VStackLayout {
    public typealias Body = Never
}

extension _VStackLayout: _VariadicView_ImplicitRoot {
    static nonisolated var implicitRoot: _VStackLayout {
        return _VStackLayout(alignment: .center, spacing: nil)
    }
}

extension _VStackLayout: Layout, HVStack {
    public typealias Cache = _StackLayoutCache
    public typealias AnimatableData = EmptyAnimatableData
    
    static var majorAxis: Axis {
        fatalError("TODO")
    }
}

protocol HVStack: Layout, _VariadicView_UnaryViewRoot {
    associatedtype MinorAxisAlignment: AlignmentGuide
    
    var spacing: CGFloat? { get }
    var alignment: Self.MinorAxisAlignment { get }
    static var majorAxis: Axis { get }
    static var resizeChildrenWithTrailingOverflow: Bool { get }
}

extension HVStack {
    static var resizeChildrenWithTrailingOverflow: Bool {
        return false
    }
    
    public static nonisolated func _makeView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView(root: root, inputs: inputs, body: body)
    }
    
    public static nonisolated var layoutProperties: LayoutProperties {
        return LayoutProperties()
    }
    
    public nonisolated func makeCache(subviews: LayoutSubviews) -> _StackLayoutCache {
        fatalError("TODO")
    }
    
    public nonisolated func updateCache(_: inout _StackLayoutCache, subviews: LayoutSubviews) {
        fatalError("TODO")
    }
    
    public nonisolated func spacing(subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> ViewSpacing {
        fatalError("TODO")
    }
    
    public nonisolated func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGSize {
        fatalError("TODO")
    }
    
    public nonisolated func placeSubviews(in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) {
        fatalError("TODO")
    }
    
    public nonisolated func explicitAlignment(of: HorizontalAlignment, in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public nonisolated func explicitAlignment(of: VerticalAlignment, in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGFloat? {
        fatalError("TODO")
    }
}

public struct _StackLayoutCache {
    // TODO
}

@available(*, unavailable)
extension _StackLayoutCache: Sendable {
}

struct AnyLayoutProperties: Rule, AsyncAttribute {
    @Attribute private var layout: AnyLayout
    
    init(layout: Attribute<AnyLayout>) {
        self._layout = layout
    }
    
    var value: Axis? {
        fatalError("TODO")
    }
}

extension _ViewListOutputs {
    fileprivate struct ApplyModifiers: Rule, AsyncAttribute {
        @Attribute private var base: ViewList
        private let modifier: _ViewListOutputs.ListModifier
        
        @inline(__always)
        init(base: Attribute<ViewList>, modifier: _ViewListOutputs.ListModifier) {
            self._base = base
            self.modifier = modifier
        }
        
        var value: ViewList {
            fatalError("TODO")
        }
    }
}
