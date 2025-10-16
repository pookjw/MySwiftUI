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
    
    private var rootFocusStoreList: AccessibilityFocusStoreList? {
        fatalError("TODO")
    }
}

extension AccessibilityViewGraph: ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        /*
         self = x19
         inputs = x25
         graph = x28
         */
        
        inputs.needsAccessibility = true
        inputs.preferences.add(AccessibilityNodesKey.self)
        inputs.textAccessibilityProvider = SwiftUITextAccessibilityProvider.self
        
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
    
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        guard graph.accessibilityEnabled else {
            return false
        }
        
        if graph.requestedOutputs.isSuperset(of: .focus) {
            if !focusStoreEnabled {
                if graph.parentHost == nil {
                    graph.addPreference(AccessibilityFocusStoreList.Key.self)
                    focusStoreEnabled = true
                    return true
                }
                
                if let rootFocusStoreList {
                    guard lastStoreVersion == rootFocusStoreList.version else {
                        graph.addPreference(AccessibilityFocusStoreList.Key.self)
                        focusStoreEnabled = true
                        return true
                    }
                }
            }
        }
        
        // <+664>
        
        guard nodesReadSinceLastUpdate else {
            return false
        }
        
        guard let rootNodes else {
            return needsFocusUpdate
        }
        
        guard lastNodeVersion == rootNodes.version else {
            return true
        }
        
        return needsFocusUpdate
    }
    
    func update(graph: ViewGraph) {
        fatalError("TODO")
    }
}

struct AccessibilityNodesKey: PreferenceKey {
    static nonisolated(unsafe) let defaultValue: AccessibilityNodeList = {
        fatalError("TODO")
    }()
    
    static func reduce(value: inout AccessibilityNodeList, nextValue: () -> AccessibilityNodeList) {
        fatalError("TODO")
    }
}

struct SwiftUITextAccessibilityProvider: TextAccessibilityProvider {
    typealias Body = StyledTextContentView
}
