// 1C3B77B617AD058A6802F719E38F5D79
internal import CoreGraphics
private import AttributeGraph

protocol UnaryLayout : Animatable, MultiViewModifier, PrimitiveViewModifier {
    associatedtype PlacementContextType
    
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing
    nonisolated func placement(of proxy: LayoutProxy, in context: Self.PlacementContextType) -> _Placement
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize
    nonisolated func layoutPriority(child: LayoutProxy) -> Double
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
}

extension UnaryLayout where PlacementContextType == PlacementContext {
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         inputs -> x1 -> x21
         body -> x2/x3 -> x23/x24
         */
        // w28
        let options = inputs.base.options
        
        guard !options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty else {
            return body(_Graph(), inputs)
        }
        
        // <+84>
        // modifier -> x0 -> x20
        let layoutComputer = UnaryLayoutComputer<Self>(
            layout: modifier.value,
            environment: inputs.base.cachedEnvironment.value.environment,
            childLayoutComputer: OptionalAttribute()
        )
        
        // x29 - 0x48
        let attribute = Attribute(layoutComputer)
        
        if options.contains(.viewNeedsGeometry) {
            // <+360>
            assertUnimplemented()
        } else {
            // <+724>
            // w26 = 0
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
}

extension UnaryLayout where PlacementContextType == _PositionAwarePlacementContext {
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct UnaryLayoutComputer<T : UnaryLayout> : StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: T
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
}
