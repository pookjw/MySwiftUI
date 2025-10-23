// D16C83991EAE21A87411739F6DC01498

#warning("TODO")
internal import AttributeGraph

struct HitTestBindingFeature: ViewGraphFeature {
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        // $s7SwiftUI21HitTestBindingFeatureV17modifyViewOutputs7outputs6inputs5graphyAA01_hI0Vz_AA01_H6InputsVAA0H5GraphCtFTf4nndn_n
        /*
         outputs = x19
         inputs = x20
         */
        // sp + 0x80
        var copy = inputs
        guard copy.preferences.contains(ViewRespondersKey.self) else {
            return
        }
        
        // inlined
        // x21
        let responder = HitTestBindingResponder3D(inputs: inputs)
        
        // <+400>
        // x22
        let viewResponders: Attribute<[ViewResponder]>
        if let _viewResponders: Attribute<[ViewResponder]> = outputs[ViewRespondersKey.self] {
            viewResponders = _viewResponders
        } else {
            // <+424>
            viewResponders = ViewGraph.current.intern([], for: [ViewResponder].self, id: .defaultValue)
        }
        
        // <+520>
        // sp
        let filter = HitTestBindingFilter(children: viewResponders, responder: responder)
        let attribute = Attribute(filter)
        outputs[ViewRespondersKey.self] = attribute
    }
}

final class HitTestBindingResponder3D: DefaultLayoutViewResponder {
    @inline(__always)
    override init(inputs: _ViewInputs) {
        super.init(inputs: inputs)
    }
    
    @inline(__always)
    override init(inputs: _ViewInputs, viewSubgraph: Subgraph) {
        super.init(inputs: inputs, viewSubgraph: viewSubgraph)
    }
}

fileprivate final class HitTestBindingResponder: DefaultLayoutViewResponder {}

fileprivate struct HitTestBindingFilter: StatefulRule {
    @Attribute private var children: [ViewResponder]
    private let responder: HitTestBindingResponder3D
    
    init(children: Attribute<[ViewResponder]>, responder: HitTestBindingResponder3D) {
        self._children = children
        self.responder = responder
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        fatalError("TODO")
    }
}
