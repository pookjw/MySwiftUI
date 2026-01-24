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
        return LayoutProperties()
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
        return ()
    }
}

extension Layout {
    @_alwaysEmitIntoClient @_disfavoredOverload public func callAsFunction<V>(@ViewBuilder _ content: () -> V) -> some View where V : View {
        return _VariadicView.Tree(_LayoutRoot(self)) { content() }
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
        case .staticList(let elements):
            // <+1076>
            // sp + 0xa8
            let copy_6 = views
            if options.contains(.needsDynamicLayout) {
                // <+1304>
                // sp + 0x130
                let copy_7 = copy_2
                // sp + 0xd0
                let copy_8 = copy_2
                // sp + 0x1c0
                let copy_9 = copy_1
                // sp + 0x50
                let _ = copy_7
                
                let elements = listOutputs.makeAttribute(viewInputs: copy_9)
                return Self.makeDynamicView(root: root, inputs: copy_8, properties: layoutProperties, list: elements)
            } else {
                // <+1092>
                // sp + 0x130
                let _ = copy_2
                // sp + 0xd0
                let copy_8 = copy_2
                return Self.makeStaticView(root: root, inputs: copy_8, properties: layoutProperties, list: elements)
            }
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

extension Layout {
    static func defaultDepthThatFits(_ size: _ProposedSize3D, children: LayoutProxyCollection, geometries: [ViewGeometry]) -> CGFloat {
        // sp + 0x38, sp + 0x34
        let depth = size.depth
        // sp + 0x24, (x28 -> sp + 0x18), x21 (buffer)
        let copy_1 = children
        // geometries -> sp + 0x40
        
        guard !children.isEmpty else {
            return 0
        }
        
        Update.assertIsLocked()
        
        // <+112>
        // x19
        var index = 0
        var d8: CGFloat = 0
        
        repeat {
            assert(index < copy_1.endIndex)
            guard index != geometries.endIndex else {
                break
            }
            assert(index < geometries.endIndex)
            
            let d9 = copy_1[index].layoutComputer.depthThatFits(size)
            
            // <+260>
            index &+= 1
            if d8 <= d9 {
                d8 = d9
            }
        } while index != copy_1.endIndex
        
        return d8
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
    var isDefaultEmptyLayout: Bool
    var isIdentityUnaryLayout: Bool
}

public protocol LayoutValueKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
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
