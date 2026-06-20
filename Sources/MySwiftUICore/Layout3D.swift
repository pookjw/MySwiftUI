internal import CoreGraphics
internal import Spatial
internal import AttributeGraph

protocol Layout3D : Layout {
    static var depthProperties: LayoutDepthProperties { get }
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache)
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat?
}

extension Layout3D {
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    static var depthProperties : LayoutDepthProperties {
        return LayoutDepthProperties(stackOrientationIsDepth: false)
    }
    
    func updateLayoutComputer<T : StatefulRule>(rule: inout T, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) where T.Value == LayoutComputer {
        rule.update(
            modify: { (engine: inout ViewLayoutEngine3D<Self>) in
                // $s7SwiftUI8Layout3DPAAE20updateLayoutComputer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0E15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0eF0V5ValueRtd__lFyAA04ViewE8Engine3DVyxGzXEfU_TA
                engine.update(layout: self, context: layoutContext, children: children)
            },
            create: {
                // $s7SwiftUI8Layout3DPAAE20updateLayoutComputer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0E15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0eF0V5ValueRtd__lFAA04ViewE8Engine3DVyxGyXEfU0_TA
                return ViewLayoutEngine3D(layout: self, context: layoutContext, children: children)
            }
        )
    }
}

struct LayoutDepthProperties {
    private(set) var stackOrientationIsDepth: Bool
    // TODO
}

struct AnyLayoutDepthProperties : AsyncAttribute, Rule {
    @Attribute private(set) var layout: AnyLayout
    
    var value: Bool {
        assertUnimplemented()
    }
}
