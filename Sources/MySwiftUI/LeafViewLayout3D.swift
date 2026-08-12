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

fileprivate struct LayoutEngine3D<T : LeafViewLayout3D> : LayoutEngine {
    private let view: T
    private var sizeCache = Cache3<_ProposedSize, CGSize>() // 0x24 (field)
    private var depthCache = Cache3<_ProposedSize3D, CGFloat>() // 0x28 (field)
    
    init(_ view: T) {
        self.view = view
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        let view = self.view
        
        return self.sizeCache.get(proposedSize) { 
            // $s7SwiftUI14LayoutEngine3D33_10361B706F31F0914DE4AF1C66017C27LLV12sizeThatFitsySo6CGSizeVAA13_ProposedSizeVFAGyXEfU_TA
            return view.sizeThatFits(in: proposedSize)
        }
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        let view = self.view
        
        return self.depthCache.get(proposedSize) { 
            // $s7SwiftUI14LayoutEngine3D33_10361B706F31F0914DE4AF1C66017C27LLV13depthThatFitsy12CoreGraphics7CGFloatVAA15_ProposedSize3DVFAHyXEfU_TA
            return view.depthThatFits(in: proposedSize)
        }
    }
}
