public import CoreGraphics
internal import AttributeGraph

@preconcurrency public protocol Layout : Sendable, Animatable {
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
        cache = makeCache(subviews: subviews)
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Self.Subviews, cache: inout Self.Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    public func spacing(subviews: Self.Subviews, cache: inout Self.Cache) -> ViewSpacing {
        assertUnimplemented()
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
    static func defaultDepthThatFits(_ size: _ProposedSize3D, children: LayoutProxyCollection, geometries: [ViewGeometry]) -> CGFloat {
        // sp + 0x38, sp + 0x34
        let _ = size.depth
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
package struct LayoutPriorityTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: Double {
        get { 0.0 }
    }
    
    @usableFromInline
    package typealias Value = Double
}

@available(*, unavailable)
extension LayoutPriorityTraitKey : Sendable {
}

public struct LayoutProperties : Sendable {
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

struct LayoutPriorityLayout : UnaryLayout {
    var priority: Double
    
    init(priority: Double) {
        self.priority = priority
    }
    
    nonisolated func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        assertUnimplemented()
    }
    
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    nonisolated func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
}
