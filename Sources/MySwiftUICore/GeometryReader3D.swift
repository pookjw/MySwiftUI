// 638EB2064D6D992C8A48A894A8F58A16
private import CoreGraphics
private import Spatial
private import AttributeGraph

fileprivate struct GeometryReaderLayout3D : Layout3D {
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

extension _ViewOutputs {
    static func makePlatformRootGeometryTransform(inputs: _ViewInputs, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var copy = inputs
        
        let transform = RootDepthTransform(
            transform: copy.transform,
            layoutDirection: OptionalAttribute(copy.layoutDirection),
            proposedSize: copy.size,
            safeAreaInsets: OptionalAttribute(),
            childLayoutComputer: OptionalAttribute()
        )
        
        let transformAttribute = Attribute(transform)
        copy.transform = transformAttribute
        
        let outputs = body(copy)
        transformAttribute.mutateBody(as: RootDepthTransform.self, invalidating: true) { transform in
            transform.$childLayoutComputer = outputs.layoutComputer
        }
        
        return outputs
    }
}
