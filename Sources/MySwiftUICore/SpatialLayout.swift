internal import CoreGraphics
internal import Spatial
internal import AttributeGraph

protocol SpatialLayout : Animatable {
    associatedtype Cache3D
    
    static var layoutProperties: SpatialLayoutProperties { get }
    
    func makeCache(subviews: SpatialLayoutSubviews) -> Self.Cache3D
    func updateCache(_ cache: inout Self.Cache3D, subviews: SpatialLayoutSubviews)
    func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> Size3D
    func placeSubviews(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D)
    func spacing(subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> ViewSpacing3D
    func explicitAlignment(of guide: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    func explicitAlignment(of guide: VerticalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    static func _makeSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs
    
    // 아래들은 method descriptor는 없지만 symbol이 존재함
    static func makeDynamicSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs
    static func makeStaticSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: _ViewList_Elements) -> _ViewOutputs
}

extension SpatialLayout {
    func updateSpatialLayoutComputer<T : StatefulRule>(rule: inout T, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) where T.Value == LayoutComputer {
        assertUnimplemented()
    }
}

// type descriptor가 존재하지 않음
struct SpatialLayoutProperties {
    let value: UInt32
}

struct SpatialLayoutSubview {
    // TODO
}

struct SpatialLayoutSubviews {
    // TODO
}

struct ViewSpacing3D {
    // TODO
}
