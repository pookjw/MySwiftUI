// 10361B706F31F0914DE4AF1C66017C27
@_spi(Internal) internal import MySwiftUICore
internal import CoreGraphics
private import AttributeGraph

protocol LeafViewLayout3D : LeafViewLayout {
    func depthThatFits(in proposedSize: _ProposedSize3D) -> CGFloat
}

extension LeafViewLayout3D {
    static nonisolated func makeLeafLayout(_ outputs: inout _ViewOutputs, view: _GraphValue<Self>, inputs: _ViewInputs) {
        guard inputs.requestsLayoutComputer else {
            return
        }
        
        let layoutComputer = LeafLayoutComputer3D(view: view.value)
        outputs.layoutComputer = Attribute(layoutComputer)
    }
}

fileprivate struct LeafLayoutComputer3D<T : LeafViewLayout3D> : CustomStringConvertible, AsyncAttribute, StatefulRule {
    @Attribute fileprivate private(set) var view: T
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
