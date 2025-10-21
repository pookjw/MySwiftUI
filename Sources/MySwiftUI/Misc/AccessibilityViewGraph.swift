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
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        // $s7SwiftUI22AccessibilityViewGraphV06modifyD6Inputs6inputs5graphyAA01_dG0Vz_AA0dE0CtF
        /*
         self = x19
         inputs = x25
         graph = x28
         */
        
        inputs.needsAccessibility = true
        inputs.preferences.add(AccessibilityNodesKey.self)
        inputs.textAccessibilityProvider = SwiftUITextAccessibilityProvider.self
        inputs.imageAccessibilityProvider = SwiftUIImageAccessibilityProvider.self
        inputs.privacyReductionAccessibilityProvider = SwiftUIPrivacyReductionAccessibilityProvider.self
        inputs.layoutAccessibilityProvider = SwiftUILayoutAccessibilityProvider.self
        inputs.gestureAccessibilityProvider = SwiftUIGestureAccessibilityProvider.self
        inputs.opacityAccessibilityProvider = SwiftUIOpacityAccessibilityProvider.self
        inputs.contentShapeAccessibilityProvider = SwiftUIContentShapeAccessibilityProvider.self
        inputs.allowsHitTestingAccessibilityProvider = SwiftUIAllowsHitTestingAccessibilityProvider.self
        inputs.hiddenAccessibilityProvider = SwiftUIHiddenAccessibilityProvider.self
        inputs.customHoverEffectAccessibilityProvider = SwiftUICustomHoverEffectsAccessibilityProvider.self
        inputs.remoteEffectsAccessibilityProvider = SwiftUIRemoteEffectsAccessibilityProvider.self
        
        // <+436>
        if graph.requestedOutputs.isSuperset(of: .layout) {
            inputs.needsAccessibilityGeometry = true
            inputs.base[AccessibilityCapturesViewResponders.self] = true
        }
        
        // <+624>
        inputs.makeRootAccessibilityRelationshipScope()
        self.relationshipScope = inputs[AccessibilityRelationshipScope.self]
        
        // <+712>
        inputs.base.accessibilityFocusStore = OptionalAttribute(base: AnyOptionalAttribute(_accessibilityFocusStore.base.identifier))
        inputs.base.accessibilityFocus = OptionalAttribute(base: AnyOptionalAttribute(_accessibilityFocus.base.identifier))
        
        if graph.requestedOutputs.contains(.focus) && focusStoreEnabled && (graph.parentHost != nil) {
            graph.removePreference(AccessibilityFocusStoreList.Key.self)
        }
    }
    
    mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        /*
         self = x19
         inputs = x20
         outputs = x22
         */
        // x23
        var copy = inputs
        copy.base.accessibilityCapturesViewResponders = false
        
        let nodeList = MainActor.assumeIsolated { [unchecked = UncheckedSendable((copy, outputs))] in
            let nodeList = AccessibilityContainerModifier
                .makeResolvableTransform(
                    inputs: unchecked.value.0,
                    outputs: unchecked.value.1,
                    includeGeometry: true,
                    for: AccessibilityContainerResolver<AccessibilityChildBehavior.Host>.self
                )
            return UncheckedSendable(nodeList)
        }.value
        
        outputs[AccessibilityNodesKey.self] = nodeList
        self._rootNodes = WeakAttribute(outputs[AccessibilityNodesKey.self])
        self._hostPreferences = WeakAttribute(outputs[HostPreferencesKey.self])
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

struct SwiftUITextAccessibilityProvider: TextAccessibilityProvider {
    public var body: Never {
        fatalError("TODO")
    } // TODO
}

struct SwiftUIImageAccessibilityProvider: ImageAccessibilityProvider {
    
}

struct SwiftUIPrivacyReductionAccessibilityProvider: PrivacyReductionAccessibilityProvider {
    func body(content: Content) -> Never {
        fatalError("TODO") // TODO
    }
}

struct SwiftUILayoutAccessibilityProvider: LayoutAccessibilityProvider {
    
}

struct SwiftUIGestureAccessibilityProvider: GestureAccessibilityProvider {
    
}

struct SwiftUIOpacityAccessibilityProvider: OpacityAccessibilityProvider {
    
}

struct SwiftUIContentShapeAccessibilityProvider: ContentShapeAccessibilityProvider {
    
}

struct SwiftUIAllowsHitTestingAccessibilityProvider: AllowsHitTestingAccessibilityProvider {
    
}

struct SwiftUIHiddenAccessibilityProvider: HiddenAccessibilityProvider {
    
}

struct SwiftUICustomHoverEffectsAccessibilityProvider: CustomHoverEffectAccessibilityProvider {
    
}

struct SwiftUIRemoteEffectsAccessibilityProvider: RemoteEffectsAccessibilityProvider {
    
}

fileprivate struct AccessibilityCapturesViewResponders: ViewInputBoolFlag {
    
}
