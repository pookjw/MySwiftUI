package import AttributeGraph

@_spi(Internal) open class DefaultLayoutViewResponder: MultiViewResponder {
    let inputs: _ViewInputs
    let viewSubgraph: Subgraph
    var childSubgraph: Subgraph?
    var childViewSubgraph: Subgraph?
    var invalidateChildren: (() -> Void)?
    
    @inline(__always)
    package init(inputs: _ViewInputs) {
        self.childSubgraph = nil
        self.childViewSubgraph = nil
        self.invalidateChildren = nil
        self.inputs = inputs
        self.viewSubgraph = .current!
        
        super.init()
    }
    
    @inline(__always)
    package init(inputs: _ViewInputs, viewSubgraph: Subgraph) {
        self.childSubgraph = nil
        self.childViewSubgraph = nil
        self.invalidateChildren = nil
        self.inputs = inputs
        self.viewSubgraph = viewSubgraph
        
        super.init()
    }
    
    open func makeGesture(inputs: _GestureInputs) -> _GestureOutputs<Void> {
        fatalError("TODO")
    }
    
    open func resetGesture() {
        fatalError("TODO")
    }
    
    open func childrenDidChange() {
        fatalError("TODO")
    }
    
    open func extendPrintTree(string: inout String) {
        fatalError("TODO")
    }
}
