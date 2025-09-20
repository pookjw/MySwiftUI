#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
private import AttributeGraph

struct AccessibilityViewGraph {
    private var relationshipScope: AccessibilityRelationshipScope? = nil
    @WeakAttribute private var rootNodes: AccessibilityNodeList?
    private var lastNodeVersion: DisplayList.Version = DisplayList.Version()
    private var nodesReadSinceLastUpdate: Bool = false
    @WeakAttribute private var hostPreferences: PreferenceValues?
    @OptionalAttribute private var accessibilityFocusStore: AccessibilityFocusStore?
    @OptionalAttribute private var accessibilityFocus: AccessibilityFocus?
    private var needsFocusUpdate: Bool = true
    private var focusStoreEnabled: Bool = false
    private var lastStoreVersion = DisplayList.Version()
    
    init(graph: ViewGraph) {
        let oldCurrent = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        
        let accessibilityFocusStore: OptionalAttribute<AccessibilityFocusStore>
        if graph.requestedOutputs.isSuperset(of: .focus) {
            accessibilityFocusStore = OptionalAttribute(Attribute(value: AccessibilityFocusStore()))
        } else {
            accessibilityFocusStore = OptionalAttribute()
        }
        self._accessibilityFocusStore = accessibilityFocusStore
        
        Subgraph.current = oldCurrent
    }
}

extension AccessibilityViewGraph: ViewGraphFeature {
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
        
        guard graph.accessibilityEnabled else {
            return false
        }
        
        if graph.requestedOutputs.isSuperset(of: .focus) {
            // <+484>
        }
        
        // <+664>
        fatalError("TODO")
    }
    
    func update(graph: ViewGraph) {
        fatalError("TODO")
    }
}
