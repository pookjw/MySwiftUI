package import CoreGraphics

package protocol UnaryDepthLayout : Animatable, MultiViewModifier, PrimitiveViewModifier {
    func depthThatFits(in: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat
    func depthPlacement(of: LayoutProxy, in: PlacementContext3D) -> DepthPlacement
    func depthOffered(to: LayoutProxy, for: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat?
}

extension UnaryDepthLayout {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
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
