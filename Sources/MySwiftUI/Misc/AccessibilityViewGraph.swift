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

extension AccessibilityViewGraph: ViewGraphFeature {}
