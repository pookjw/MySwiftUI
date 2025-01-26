import AttributeGraph

package class GraphHost {
    
}

extension GraphHost {
    package struct Data {
#warning("순서 검증하기")
        @AttributeGraph.Attribute package var time: Time
        @AttributeGraph.Attribute package var environment: EnvironmentValues
        @AttributeGraph.Attribute package var hostPreferenceKeys: PreferenceKeys
        @AttributeGraph.Attribute package var transaction: Transaction
        @AttributeGraph.Attribute package var updateSeed: UInt32
        @AttributeGraph.Attribute package var graph: AttributeGraph.AGGraph?
        @AttributeGraph.Attribute package var globalSubgraph: AttributeGraph.AGSubgraph
        @AttributeGraph.Attribute package var rootSubgraph: AttributeGraph.AGSubgraph
        @AttributeGraph.Attribute package var isRemoved: Bool
        @AttributeGraph.Attribute package var isHiddenForReuse: Bool
#warning("마저 더 하기")
        
        init() {
            fatalError("TODO")
        }
    }
}
