// 740EB2CA70C6E534C8611E22FBE70272
@_spi(Internal) internal import MySwiftUICore
private import AttributeGraph

struct ViewGraphBridgePropertiesFeature: ViewGraphFeature {
    @WeakAttribute private var parentBridgeProperties: ViewGraphBridgeProperties?
    @WeakAttribute private var bridgeProperties: ViewGraphBridgeProperties?
    @OptionalAttribute private var environment: EnvironmentValues?
    private var lastParentBridgeProperties: ViewGraphBridgeProperties?
    private var lastLocalBridgeProperties: ViewGraphBridgeProperties?
    private var lastEnvironment: EnvironmentValues?
    
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
        /*
         self -> x20 -> x19
         viewGraph -> x0 -> x20
         */
        let environment: EnvironmentValues?
        if
            let delegate = graph.delegate,
            delegate.as(ViewGraphBridgePropertiesDelegate.self) != nil
        {
            // <+304>
            environment = self.environment
            // <+420>
        } else {
            // <+340>
            if $parentBridgeProperties != nil {
                return true
            } else {
                return $environment != nil
            }
        }
        
        // <+420>
        // x24 (sp + 0x10)
        let lastEnvironment = lastEnvironment
        // x24 + 0x10 (sp + 0x20)
        let copy_1 = environment
        
        // <+528>
        var w27: Bool
        if let lastEnvironment {
            if let copy_1 {
                // <+608>
                w27 = !lastEnvironment.isIdentical(to: copy_1)
            } else {
                w27 = true
            }
        } else {
            if copy_1 == nil {
                w27 = false
            } else {
                w27 = true
            }
        }
        
        // <+696>
        if let parentBridgeProperties {
            // <+720>
            if parentBridgeProperties != lastParentBridgeProperties {
                w27 = true
            }
        } else {
            // <+868>
            if let lastParentBridgeProperties {
                // <+892>
                w27 = true
            }
        }
        
        return w27
    }
    
    mutating func outputsDidChange(graph: ViewGraph) {
        /*
         self -> x20 -> x19
         graph -> x0 -> x26
         */
        defer {
            // $s7SwiftUI32ViewGraphBridgePropertiesFeatureV16outputsDidChange5graphyAA0cD0C_tF6$deferL_yyF
            // self -> x0 -> x19
            // x27, x28, x24, x25
            let parentBridgeProperties = parentBridgeProperties
            self.lastParentBridgeProperties = parentBridgeProperties
            
            // <+296>
            self.lastEnvironment = environment
        }
        
        // <+212>
        guard
            let delegate = graph.delegate,
            let propertiesDelegate = delegate.as(ViewGraphBridgePropertiesDelegate.self)
        else {
            // <+372>
            _parentBridgeProperties = WeakAttribute()
            _bridgeProperties = WeakAttribute()
            _environment = OptionalAttribute()
            return
        }
        
        // <+284>
        // x26, x25, x28, x27
        let parentBridgeProperties = parentBridgeProperties
        
        // <+440>
        // x21, x22, x27, x28
        let newProperties = propertiesDelegate.updateRequiredBridges(parentBridgeProperties, allowedActions: [.unknown0, .unknown1])
        _ = consume parentBridgeProperties
        
        // x23, x24, x25, x26
        let lastLocalBridgeProperties = lastLocalBridgeProperties
        
        guard newProperties != lastLocalBridgeProperties else {
            return
        }
        
        // sp + 0x108
        let copy_1 = newProperties
        
        graph.asyncTransaction(
            mutation: ViewGraphBridgePropertiesFeature.BridgePropertiesMutation(
                bridgeProperties: _bridgeProperties,
                newValue: newProperties
            ),
            style: .deferred
        )
        self.lastLocalBridgeProperties = newProperties
    }
}

extension ViewGraphBridgePropertiesFeature {
    fileprivate struct MakeBridgeProperties: Rule {
        @WeakAttribute var overrideValue: ViewGraphBridgeProperties?
        var localValue: ViewGraphBridgeProperties?
        
        var value: ViewGraphBridgeProperties {
            fatalError("TODO")
        }
    }
    
    fileprivate struct BridgePropertiesMutation: GraphMutation {
        @WeakAttribute var bridgeProperties: ViewGraphBridgeProperties?
        private(set) var newValue: ViewGraphBridgeProperties?
        
        func apply() {
            guard let attribute = $bridgeProperties else {
                return
            }
            
            attribute.mutateBody(as: ViewGraphBridgePropertiesFeature.MakeBridgeProperties.self, invalidating: true) { properties in
                // $s7SwiftUI32ViewGraphBridgePropertiesFeatureV0eF8Mutation33_740EB2CA70C6E534C8611E22FBE70272LLV5applyyyFyAC04MakeeF0AELLVzXEfU_
                properties.localValue = newValue
            }
        }
        
        func combine<T>(with other: T) -> Bool where T : GraphMutation {
            fatalError("TODO")
        }
    }
}
