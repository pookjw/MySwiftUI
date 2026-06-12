package import CoreGraphics

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
        
        if w27.contains([.viewRequestsLayoutComputer, .viewNeedsGeometry]) {
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
            
            // x22
            let outputs = _ViewOutputs.makeDepthTransform(
                inputs: copy_4,
                depth: {
                    // $s7SwiftUI16UnaryDepthLayoutPAAE9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VyAA0gD8GeometryVGyXEfU_TA
                    /*
                     TODO
                     
                     animatableAttribute
                     Self
                     */
                    assertUnimplemented()
                },
                body: body
            )
            
            // <+364>
            assertUnimplemented()
        } else {
            // <+524>
            assertUnimplemented()
        }
        
        assertUnimplemented()
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
