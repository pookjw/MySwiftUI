#warning("TODO")
public import AttributeGraph

@_spi(Internal) open class DefaultLayoutViewResponder: MultiViewResponder {
    let inputs: _ViewInputs
    let viewSubgraph: AGSubgraphRef
    var childSubgraph: AGSubgraphRef?
    var childViewSubgraph: AGSubgraphRef?
    var invalidateChildren: (() -> Void)?
    
    public init(inputs: _ViewInputs) {
        fatalError("TODO")
    }
}
