#warning("TODO")
internal import MySwiftUICore
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

extension InteractiveResizeChangeViewGraphFeature: ViewGraphFeature {}
