#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
package import AttributeGraph

struct InteractiveResizeChangeViewGraphFeature {
    private var bridge: InteractiveResizeBridge
    @Attribute private var isInteractivelyResizing: Bool
    
    init(viewGraph: ViewGraph, bridge: InteractiveResizeBridge) {
        // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfc
        self.bridge = bridge
        let oldCurrent = Subgraph.current
        Subgraph.current = viewGraph.globalSubgraph
        self._isInteractivelyResizing = Attribute(value: false)
        Subgraph.current = oldCurrent
    }
}

extension InteractiveResizeChangeViewGraphFeature: ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    func update(graph: ViewGraph) {
        fatalError("TODO")
    }
}
