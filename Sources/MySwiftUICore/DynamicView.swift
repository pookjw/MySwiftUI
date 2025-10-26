// 3FB6ABB0477B815AB3C89DD5EDC9F0F0

#warning("TODO")
internal import AttributeGraph

protocol DynamicView {
    associatedtype Metadata
    associatedtype ID : Equatable
    
    static nonisolated var canTransition: Bool {
        get
    }
    
    static nonisolated var traitKeysDependOnView: Bool {
        get
    }
    
    static nonisolated func makeID() -> ID
    
    nonisolated func childInfo(metadata: Metadata) -> (Any.Type, ID?)
    
    nonisolated func makeChildView(metadata: Metadata, view: Attribute<Self>, inputs: _ViewInputs) -> _ViewOutputs
    
    nonisolated func makeChildViewList(metadata: Metadata, view: Attribute<Self>, inputs: _ViewListInputs) -> _ViewListOutputs
}

extension DynamicView {
    static nonisolated func makeDynamicView(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         x29 = sp + 0x1b0
         x25 = sp + 0x70
         view = x22
         inputs = x24
         */
        // sp + 0x70
        var copy_1 = inputs
        // sp + 0xf0
        /*
         preferences = x20
         debugProperties = x19
         _layoutComputer = w21
         */
        let outputs = copy_1.makeIndirectOutputs()
        _ = consume copy_1
        // sp + 0x70
        let container = DynamicViewContainer<Self>(
            metadata: metadata,
            view: view.value,
            inputs: inputs,
            outputs: outputs
        )
        // x24
        let containerAttribute = Attribute(container)
        containerAttribute.flags = .unknown1
        outputs.setIndirectDependency(containerAttribute.identifier)
        
        return outputs
    }
    
    static nonisolated func makeDynamicViewList(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    static nonisolated var traitKeysDependOnView: Bool {
        fatalError("TODO")
    }
}

extension DynamicView where ID == UniqueID {
    static nonisolated func makeID() -> UniqueID {
        return UniqueID()
    }
}

fileprivate struct DynamicViewContainer<Content: DynamicView>: StatefulRule {
    private let metadata: Content.Metadata
    @Attribute private var view: Content
    private let inputs: _ViewInputs
    private let outputs: _ViewOutputs
    private let parentSubgraph: Subgraph
    
    init(
        metadata: Content.Metadata,
        view: Attribute<Content>,
        inputs: _ViewInputs,
        outputs: _ViewOutputs,
    ) {
        self.metadata = metadata
        self._view = view
        self.inputs = inputs
        self.outputs = outputs
        self.parentSubgraph = .current!
    }
    
    func updateValue() {
        // x29 = sp + 0x170
        /*
         self/sp + 0xc0 = x23
         x25/sp + 0xd8 = Content
         x29 = sp + 0xe0
         */
        // x23
        let childInfo = view.childInfo(metadata: metadata)
        // x22
        let oldValue: Self.Value? = (hasValue ? value : nil)
        // <+524>
        guard oldValue.map({ $0.matches(type: childInfo.0, id: childInfo.1) }) != true else {
            return
        }
        
        // <+696>
        /*
         self = 0xa8
         oldValue = 0xb0
         */
        if let oldValue {
            // <+780>
            outputs.detachIndirectOutputs()
            oldValue.subgraph.willInvalidate(isInserted: true)
            oldValue.subgraph.invalidate()
        }
        
        // <+944>
        let graph = Subgraph(graph: parentSubgraph.graph)
        parentSubgraph.addChild(graph)
        
        self.value = graph.apply {
            // $s7SwiftUI20DynamicViewContainer031_3FB6ABB0477B815AB3C89DD5EDC9F0M0LLV11updateValueyyFAD0O0Vyx_GyXEfU0_
            var inputs = inputs
            inputs.copyCaches()
            let childOutputs = view.makeChildView(metadata: metadata, view: $view, inputs: inputs)
            outputs.attachIndirectOutputs(to: childOutputs)
            let value = DynamicViewContainer.Value(type: childInfo.0, id: childInfo.1, subgraph: graph)
            return value
        }
    }
}

extension DynamicViewContainer {
    fileprivate struct Value {
        private(set) var type: any Any.Type
        private(set) var id: Content.ID?
        private(set) var subgraph: Subgraph
        
        init(type: any Any.Type, id: Content.ID? = nil, subgraph: Subgraph) {
            self.type = type
            self.id = id
            self.subgraph = subgraph
        }
        
        func matches(type: any Any.Type, id: Content.ID?) -> Bool {
            guard self.type == type else {
                return false
            }
            
            return id.map { self.id == $0 } != false
        }
    }
}
