import AttributeGraph

package final class IndirectAttributeMap {
    package let subgraph: AttributeGraph.AGSubgraph
    package var map: [AttributeGraph.AGAttribute: AttributeGraph.AGAttribute]
    
    package init(subgraph: AttributeGraph.AGSubgraph) {
        self.subgraph = subgraph
        map = [:]
    }
}
