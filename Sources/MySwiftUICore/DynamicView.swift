// 3FB6ABB0477B815AB3C89DD5EDC9F0F0

#warning("TODO")
internal import AttributeGraph

protocol DynamicView: View {
    associatedtype Metadata
    associatedtype ID
    
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
            outputs: outputs,
            parentSubgraph: .current!
        )
        // x24
        let containerAttribute = Attribute(container)
        containerAttribute.flags = .unknown1
        outputs.preferences.setIndirectDependency(containerAttribute.identifier)
        
        if let layoutComputer = outputs.layoutComputer {
            layoutComputer.identifier.indirectDependency = containerAttribute.identifier
        }
        
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
        parentSubgraph: Subgraph
    ) {
        self.metadata = metadata
        self._view = view
        self.inputs = inputs
        self.outputs = outputs
        self.parentSubgraph = parentSubgraph
    }
    
    func updateValue() {
        fatalError("TODO")
    }
}

extension DynamicViewContainer {
    fileprivate struct Value {
        private var type: any Any.Type
        private var id: Content.ID?
        private var subgraph: Subgraph
    }
}
