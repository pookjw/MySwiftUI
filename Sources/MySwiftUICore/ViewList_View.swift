// 9B09D1820E97ECBB666F7560EA2A2D2C
internal import AttributeGraph

package struct _ViewList_View : View {
    @safe private nonisolated(unsafe) var elements: _ViewList_SubgraphElements
    @safe private nonisolated(unsafe) var releaseElements: _ViewList_SubgraphRelease?
    @safe nonisolated(unsafe) var id: _ViewList_ID
    @safe private nonisolated(unsafe) var index: Int
    @safe private nonisolated(unsafe) var count: Int
    @safe private nonisolated(unsafe) var contentSubgraph: Subgraph?
    
    var viewID: AnyHashable {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    nonisolated init(elements: _ViewList_SubgraphElements, releaseElements: _ViewList_SubgraphRelease?, id: _ViewList_ID, index: Int, count: Int, contentSubgraph: Subgraph?) {
        self.elements = elements
        self.releaseElements = releaseElements
        self.id = id
        self.index = index
        self.count = count
        self.contentSubgraph = contentSubgraph
    }
    
    nonisolated init(elements: _ViewList_SubgraphElements, id: _ViewList_ID, index: Int, count: Int, contentSubgraph: Subgraph) {
        assertUnimplemented()
    }
    
    var elementID: _ViewList_ID {
        assertUnimplemented()
    }
    
    var reuseIdentifier: Int {
        assertUnimplemented()
    }
    
    var subviewID: _ViewList_ID {
        assertUnimplemented()
    }
    
    package nonisolated static func _makeView(view: _GraphValue<_ViewList_View>, inputs: _ViewInputs) -> _ViewOutputs {
        let prefOutputs = inputs.preferences.makeIndirectOutputs()
        
        let layoutComputer: OptionalAttribute<LayoutComputer>
        if inputs.base.options.contains(.viewRequestsLayoutComputer) {
            // <+188>
            layoutComputer = OptionalAttribute(
                Attribute(
                    identifier: ViewGraph.current.$defaultLayoutComputer.identifier.createIndirectAttribute2(16)
                )
            )
        } else {
            layoutComputer = OptionalAttribute()
        }
        
        let outputs = _ViewOutputs(preferences: prefOutputs, layoutComputer: layoutComputer)
        
        // <+260>
        let info = PlaceholderInfo(
            placeholder: view.value,
            inputs: inputs,
            outputs: outputs,
            parentSubgraph: .current!,
            lastSubgraph: nil,
            lastRelease: nil,
            secondaryRelease: nil,
            lastElements: nil,
            lastMap: nil,
            contentObserver: nil,
            lastPhase: nil
        )
        
        let infoAttribute = Attribute(info)
        prefOutputs.setIndirectDependency(infoAttribute.identifier)
        
        if let attribute = layoutComputer.attribute {
            attribute.identifier.indirectDependency = infoAttribute.identifier
        }
        
        return outputs
    }
    
    package nonisolated static func _makeViewList(view: _GraphValue<_ViewList_View>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

extension _ViewList_View : PrimitiveView, UnaryView {}

fileprivate struct PlaceholderInfo : StatefulRule, ObservedAttribute {
    @Attribute private(set) var placeholder: _ViewList_View // 0x0
    let inputs: _ViewInputs // 0x8
    let outputs: _ViewOutputs // 0x60
    let parentSubgraph: Subgraph // 0x70
    private(set) var lastSubgraph: Subgraph?
    private(set) var lastRelease: _ViewList_SubgraphRelease?
    private(set) var secondaryRelease: _ViewList_SubgraphRelease?
    private(set) var lastElements: _ViewList_Elements?
    private(set) var lastMap: IndirectAttributeMap?
    private(set) var contentObserver: (Subgraph, Int)?
    private(set) var lastPhase: Attribute<_GraphInputs.Phase>?
    
    func updateValue() {
        assertUnimplemented()
    }
    
    func reuseItem(info: inout PlaceholderInfo.Value, placeholder: _ViewList_View) -> Bool {
        assertUnimplemented()
    }
    
    func eraseItem() {
        assertUnimplemented()
    }
    
    func makeItem(placeholder: _ViewList_View, seed: UInt32) -> PlaceholderInfo.Value {
        assertUnimplemented()
    }
    
    mutating func destroy() {
        assertUnimplemented()
    }
}

extension PlaceholderInfo {
    struct Value {
        private var id: _ViewList_ID
        private var seed: UInt32
        private var index: Int
    }
}
