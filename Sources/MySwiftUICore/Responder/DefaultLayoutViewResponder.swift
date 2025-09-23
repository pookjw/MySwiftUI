#warning("TODO")
internal import AttributeGraph

@_spi(Internal) open class DefaultLayoutViewResponder: MultiViewResponder {
    let inputs: _ViewInputs
    let viewSubgraph: Subgraph
    var childSubgraph: Subgraph?
    var childViewSubgraph: Subgraph?
    var invalidateChildren: (() -> Void)?
    
    public init(inputs: _ViewInputs) {
        fatalError("TODO")
    }
}
