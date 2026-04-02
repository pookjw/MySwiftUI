package import AttributeGraph

@_spi(Internal) open class DefaultLayoutViewResponder : MultiViewResponder {
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
        assertUnimplemented()
    }
    
    open func resetGesture() {
        assertUnimplemented()
    }
    
    open func childrenDidChange() {
        assertUnimplemented()
    }
    
    open func extendPrintTree(string: inout String) {
        assertUnimplemented()
    }
}
