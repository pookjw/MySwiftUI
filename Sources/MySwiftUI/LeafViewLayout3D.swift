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
        self.update(to: LayoutEngine3D(self.view))
    }
    
    var description: String {
        assertUnimplemented()
    }
}

fileprivate struct LayoutEngine3D<T> : LayoutEngine {
    private let view: T
    private var sizeCache = Cache3<_ProposedSize, CGSize>()
    private var depthCache = Cache3<_ProposedSize3D, CGFloat>()
    
    init(_ view: T) {
        self.view = view
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        assertUnimplemented()
    }
}
