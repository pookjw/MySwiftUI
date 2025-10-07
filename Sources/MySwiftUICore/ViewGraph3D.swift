#warning("TODO")

private import AttributeGraph

package struct ViewGraph3D {
    @Attribute private var depthTransform: ViewTransform
    private var volumeThatFitsObservers = ViewGraphGeometryObservers<VolumeThatFitsMeasurer>()
    
    package init(graph: ViewGraph) {
        let oldCurrent = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        self._depthTransform = Attribute(graph.rootDepthTransform)
        Subgraph.current = oldCurrent
    }
}

extension ViewGraph3D: ViewGraphFeature {
    package func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    package mutating func needsUpdate(graph: ViewGraph) -> Bool {
        return volumeThatFitsObservers.needsUpdate(graph: graph)
    }
    
    package func update(graph: ViewGraph) {
        volumeThatFitsObservers.notify()
    }
}
