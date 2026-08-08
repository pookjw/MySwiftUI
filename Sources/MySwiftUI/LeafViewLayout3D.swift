@_spi(Internal) internal import MySwiftUICore
internal import CoreGraphics

protocol LeafViewLayout3D : LeafViewLayout {
    func depthThatFits(in proposedSize: _ProposedSize3D) -> CGFloat
}

extension LeafViewLayout3D {
    static func makeLeafLayout(_ outputs: inout _ViewOutputs, view: _GraphValue<Self>, inputs: _ViewInputs) {
        assertUnimplemented()
    }
}
