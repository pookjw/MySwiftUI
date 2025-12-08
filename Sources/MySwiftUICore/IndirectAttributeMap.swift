#warning("TODO")
internal import AttributeGraph

package class IndirectAttributeMap {
    let subgraph: Subgraph
    var map: [AnyAttribute: AnyAttribute]
    
    init(subgraph: Subgraph) {
        self.subgraph = subgraph
        self.map = [:]
    }
}
