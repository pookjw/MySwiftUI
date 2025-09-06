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

extension ViewGraph3D: ViewGraphFeature {}
