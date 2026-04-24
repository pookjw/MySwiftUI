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
        let layoutComputerAttribute = Attribute(layoutComputer)
        
        if options.contains(.viewNeedsGeometry) {
            // <+360>
            let layoutDirectionAttribute = inputs.base.cachedEnvironment.value.attribute(id: .layoutDirection) { environment in
                return environment.layoutDirection
            }
            
            let geometry = UnaryChildGeometry<Self>(
                parentSize: inputs.size,
                layoutDirection: layoutDirectionAttribute,
                parentLayoutComputer: layoutComputerAttribute,
                childLayoutComputer: OptionalAttribute()
            )
            
            // w26
            let geometryAttribute = Attribute(geometry)
            // x29 - 0x88
            let sizeAttribute = geometryAttribute[keyPath: \.dimensions.size]
            // x29 - 0x13c
            let originAttribute = geometryAttribute[keyPath: \.origin]
            
            let query = LayoutPositionQuery(
                parentPosition: inputs.position,
                localPosition: originAttribute
            )
            
            // x29 - 0x90
            let queryAttribute = Attribute(query)
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

fileprivate struct UnaryChildGeometry<T> : Rule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var parentSize: ViewSize
    @Attribute private(set) var layoutDirection: LayoutDirection
    @Attribute private(set) var parentLayoutComputer: LayoutComputer
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    var description: String {
        assertUnimplemented()
    }
    
    var value: ViewGeometry {
        assertUnimplemented()
    }
}

struct LayoutPositionQuery : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var parentPosition: CGPoint
    @Attribute fileprivate private(set) var localPosition: CGPoint
    
    var value: CGPoint {
        assertUnimplemented()
    }
}
