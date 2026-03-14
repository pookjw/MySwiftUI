// 638EB2064D6D992C8A48A894A8F58A16
private import CoreGraphics
private import Spatial

fileprivate struct GeometryReaderLayout3D: Layout3D {
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat {
        assertUnimplemented()
    }
    
    func explicitAlignment(of alignment: DepthAlignment, in: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout ()) {
        assertUnimplemented()
    }
    
    static var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
    
    func spacing(subviews: Subviews, cache: inout ()) -> ViewSpacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        assertUnimplemented()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}
