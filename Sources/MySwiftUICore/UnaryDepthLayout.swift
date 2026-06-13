// 34D3AEC4362799DA2D0B148FCF3EBBB0
package import CoreGraphics
internal import AttributeGraph

package protocol UnaryDepthLayout : Animatable, MultiViewModifier, PrimitiveViewModifier {
    func depthThatFits(in: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat
    func depthPlacement(of: LayoutProxy, in: PlacementContext3D) -> DepthPlacement
    func depthOffered(to: LayoutProxy, for: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat?
}

extension UnaryDepthLayout {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         body (context) -> x4 -> x24
         return pointer -> x8 -> x22
         */
        // x26 + 0x60
        let copy_1 = inputs
        // x26 + 0xc0
        let copy_2 = inputs
        let w27 = copy_2.base.options
        
        guard !w27.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty else {
            // <+524>
            // x19 + 0x80
            let copy_3 = inputs
            return body(_Graph(), copy_3)
        }
        
        // <+124>
        // x19 + 0x18
        let modifierAttribute = modifier.value
        // x19 + 0x80
        let copy_3 = inputs.base
        // inputs -> x1 -> x25
        // body (closure) -> x2 -> x19
        // x19 + 0x28
        let _ = copy_1.base
        // w20
        let animatableAttribute = Self.makeAnimatable(value: _GraphValue(modifierAttribute), inputs: copy_3)
        _ = consume copy_3
        
        // <+204>
        // x19 + 0x80
        var copy_4 = inputs
        copy_4.base.options = w27.union(.viewRequestsLayoutComputer)
        
        // x19 + 0x24
        var geometryAttribute = OptionalAttribute<ViewDepthGeometry>()
        
        // x19 + 0x28
        let _ = copy_1
        
        // x22
        var outputs = _ViewOutputs.makeDepthTransform(
            inputs: copy_4,
            geometry: {
                // $s7SwiftUI16UnaryDepthLayoutPAAE9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VyAA0gD8GeometryVGyXEfU_TA
                /*
                 animatableAttribute -> w0 -> w23
                 copy_1 -> x1 -> x22
                 attribute -> x2 -> x19
                 Self -> x3/x4 -> x21/x20
                 */
                // sp + 0xc
                let geometryRule = UnaryDepthLayoutGeometry<Self>(
                    layout: animatableAttribute,
                    parentSize: copy_1.size,
                    parentDepth: copy_1.transform[keyPath: \.depth],
                    environment: copy_1.environment,
                    childLayoutComputer: OptionalAttribute()
                )
                
                let result = Attribute(geometryRule)
                geometryAttribute = OptionalAttribute(result)
                return result
            },
            body: { inputs in
                return body(_Graph(), inputs)
            }
        )
        
        // <+364>
        if let attribute = geometryAttribute.attribute {
            attribute.mutateBody(as: UnaryDepthLayoutGeometry<Self>.self, invalidating: true) { geometry in
                geometry.$childLayoutComputer = outputs.layoutComputer
            }
        }
        
        // <+508>
        guard w27.contains(.viewRequestsLayoutComputer) else {
            return outputs
        }
        
        // <+576>
        // x19 + 0x18
        let layoutComputerRule = UnaryDepthLayoutComputer<Self>(
            layout: animatableAttribute,
            environment: copy_2.environment,
            childLayoutComputer: OptionalAttribute(outputs.layoutComputer)
        )
        
        outputs.layoutComputer = Attribute(layoutComputerRule)
        return outputs
    }
    
    package func depthThatFits(in: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat {
        assertUnimplemented()
    }
    
    package func depthPlacement(of: LayoutProxy, in: PlacementContext3D) -> DepthPlacement {
        assertUnimplemented()
    }
    
    package func depthOffered(to: LayoutProxy, for: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat? {
        assertUnimplemented()
    }
}

struct UnaryDepthLayoutGeometry<T> : Rule, AsyncAttribute {
    @Attribute private var layout: T
    @Attribute private var parentSize: ViewSize
    @Attribute private var parentDepth: ViewDepth
    @Attribute private var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    init(
        layout: Attribute<T>,
        parentSize: Attribute<ViewSize>,
        parentDepth: Attribute<ViewDepth>,
        environment: Attribute<EnvironmentValues>,
        childLayoutComputer: OptionalAttribute<LayoutComputer>
    ) {
        self._layout = layout
        self._parentSize = parentSize
        self._parentDepth = parentDepth
        self._environment = environment
        self._childLayoutComputer = childLayoutComputer
    }
    
    var value: ViewDepthGeometry {
        assertUnimplemented()
    }
}

fileprivate struct UnaryDepthLayoutComputer<L> : AsyncAttribute, StatefulRule {
    @Attribute var layout: L
    @Attribute var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
}
