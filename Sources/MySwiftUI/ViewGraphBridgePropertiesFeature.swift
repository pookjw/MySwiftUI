// 740EB2CA70C6E534C8611E22FBE70272
internal import MySwiftUICore
private import AttributeGraph

struct ViewGraphBridgePropertiesFeature: ViewGraphFeature, GraphMutation {
    @WeakAttribute private var parentBridgeProperties: ViewGraphBridgeProperties?
    @WeakAttribute private var bridgeProperties: ViewGraphBridgeProperties?
    @OptionalAttribute private var environment: EnvironmentValues?
    private var lastParentBridgeProperties: ViewGraphBridgeProperties?
    private var lastLocalBridgeProperties: ViewGraphBridgeProperties?
    private var lastEnvironment: EnvironmentValues?
    
    func apply() {
        fatalError("TODO")
    }
    
    func combine<T>(with other: T) -> Bool where T : GraphMutation {
        fatalError("TODO")
    }
    
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        /*
         self -> x20 -> x21
         inputs -> x0 -> x19
         */
        // sp + 0x40
        let viewGraphBridgeProperties = inputs.base.viewGraphBridgeProperties
        // x24
        let newAttribute = WeakAttribute(viewGraphBridgeProperties.attribute)
        self._parentBridgeProperties = newAttribute
        
        // <+204>
        self.$environment = inputs.environment
        // sp + 0x40
        let rule = ViewGraphBridgePropertiesFeature.MakeBridgeProperties(overrideValue: newAttribute, localValue: nil)
        // x24
        let attribute = WeakAttribute(Attribute(rule))
        inputs.base.viewGraphBridgeProperties = attribute
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    func outputsDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
}

extension ViewGraphBridgePropertiesFeature {
    fileprivate struct MakeBridgeProperties: Rule {
        @WeakAttribute var overrideValue: ViewGraphBridgeProperties?
        private(set) var localValue: ViewGraphBridgeProperties?
        
        var value: ViewGraphBridgeProperties {
            fatalError("TODO")
        }
    }
    
    fileprivate struct BridgePropertiesMutation: GraphMutation {
        @WeakAttribute var bridgeProperties: ViewGraphBridgeProperties?
        private var newValue: ViewGraphBridgeProperties?
        
        func apply() {
            fatalError("TODO")
        }
        
        func combine<T>(with other: T) -> Bool where T : GraphMutation {
            fatalError("TODO")
        }
    }
}
