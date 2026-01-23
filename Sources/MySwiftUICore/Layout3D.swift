internal import CoreGraphics
internal import Spatial
internal import AttributeGraph

protocol Layout3D: Layout {
    static var depthProperties: LayoutDepthProperties { get }
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache)
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat?
}

extension Layout3D {
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Cache) -> CGFloat? {
        fatalError("TODO")
    }
    
    static var depthProperties : LayoutDepthProperties {
        fatalError("TODO")
    }
    
    func updateLayoutComputer<T: StatefulRule>(rule: inout T, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) where T.Value == LayoutComputer {
        fatalError("TODO")
    }
    
    static func makeLayoutView3D(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static func makeStaticView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: _ViewList_Elements) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static func makeDynamicView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: Attribute<ViewList>) -> _ViewOutputs {
        fatalError("TODO")
    }
}

struct LayoutDepthProperties {
    private var stackOrientationIsDepth: Bool
    // TODO
}

struct AnyLayoutDepthProperties {
    @Attribute private var layout: AnyLayout
    // TODO
}
