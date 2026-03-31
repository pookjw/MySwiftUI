// 
internal import AttributeGraph

@safe package final class PreferenceBridge {
    private(set) weak var viewGraph: ViewGraph? = nil // 0x10
    private var isValid: Bool = false // 0x18
    package private(set) var children: [Unmanaged<ViewGraph>] = unsafe [] // 0x20
    private(set) var requestedPreferences = PreferenceKeys() // 0x28
    private(set) var bridgedViewInputs = PropertyList() // 0x30
    @WeakAttribute private var hostPreferenceKeys: PreferenceKeys? // 0x38
    @WeakAttribute var hostPreferencesCombiner: PreferenceValues? // 0x40
    private var bridgedPreferences: [PreferenceBridge.BridgedPreference] = [] // 0x48
    
    init() {
        // <+60>
        self.viewGraph = .current
    }
    
    func wrapInputs(_ inputs: inout _ViewInputs) {
        /*
         self -> x20
         inputs -> x0 -> x19
         */
        inputs.base.customInputs = self.bridgedViewInputs
        // <+100>
        for key in self.requestedPreferences {
            
            inputs.preferences.keys.add(key)
        }
        // <+416>
        let merged = MergePreferenceKeys(lhs: inputs.preferences.hostKeys, rhs: self._hostPreferenceKeys)
        inputs.preferences.hostKeys = Attribute(merged)
    }
    
    func wrapOutputs(_ outputs: inout PreferencesOutputs, inputs: _ViewInputs) {
        /*
         self -> x20 -> x22
         outputs -> x0 -> x20
         */
        // x23
        let keys = inputs.preferences.keys
        // x29 - 0xb4
        let hostKeys = inputs.preferences.hostKeys
        self.bridgedViewInputs = inputs.base.customInputs
        
        guard !keys.isEmpty else {
            return
        }
        
        // x29 - 0xb8
        let _ = AnyAttribute.empty
        
        for key in inputs.preferences.keys {
            // <+412>
            // key -> x27
            if key == HostPreferencesKey.self {
                // <+184>
                let values = OptionalAttribute(outputs[HostPreferencesKey.self])
                // x29 - 0x88
                let combiner = HostPreferencesCombiner(keys: hostKeys, values: values, children: [])
                // w24
                let combinerAttribute = Attribute(combiner)
                outputs[HostPreferencesKey.self] = combinerAttribute
                self.$hostPreferenceKeys = hostKeys
                self.$hostPreferencesCombiner = combinerAttribute
                continue
            }
            
            // <+456>
            guard outputs[anyKey: key] == nil else {
                continue
            }
            
            // <+492>
            func project<T: PreferenceKey>(type: T.Type) {
                // x29 - 0x88
                let combiner = PreferenceCombiner<T>(attributes: [])
                // w28
                let attribute = Attribute(combiner)
                
                if let index = requestedPreferences.firstIndex(where: { $0 == type }) {
                    requestedPreferences.keys[index] = type
                }
                
                // <+820>
                // w20
                let weakAttribute = AnyWeakAttribute(attribute.identifier)
                let bridgedPreference = PreferenceBridge.BridgedPreference(key: type, combiner: weakAttribute)
                self.bridgedPreferences.append(bridgedPreference)
                
                // <+936>
                outputs[anyKey: key] = attribute.identifier
            }
            
            _openExistential(key, do: project)
        }
    }
    
    func invalidate() {
        self.requestedPreferences = PreferenceKeys()
        self.bridgedViewInputs = PropertyList()
        
        if unsafe !children.isEmpty {
            assertUnimplemented()
        }
        
        // <+2044>
        self.viewGraph = nil
        self.isValid = false
    }
    
    func addChild(_ viewGraph: ViewGraph) {
        /*
         self -> x20
         viewGraph -> x0 -> x19
         */
        self.children.append(Unmanaged<ViewGraph>.passUnretained(viewGraph))
    }
    
    func removeChild(_ viewGraph: ViewGraph) {
        for index in self.children.indices {
            if self.children[index].takeUnretainedValue() === viewGraph {
                self.children.remove(at: index)
                break
            }
        }
    }
    
    func addValue(_: AnyAttribute, for key: PreferenceKey.Type) {
        assertUnimplemented()
    }
    
    func removeHostValues(for keys: Attribute<PreferenceKeys>, isInvalidating: Bool = false) {
        /*
         keys -> w0 -> w21
         isInvalidating -> w1 -> w19
         */
        // x22
        guard
            let viewGraph,
            let hostPreferencesCombiner = $hostPreferencesCombiner
        else {
            return
        }
        
        // <+112>
        var result = false
        
        hostPreferencesCombiner.mutateBody(as: HostPreferencesCombiner.self, invalidating: true) { combiner in
            // $s7SwiftUI16PreferenceBridgeC16removeHostValues3for14isInvalidatingy14AttributeGraph0K0VyAA0C4KeysVG_SbtFyAA0F19PreferencesCombinerVzXEfU_TA.7
            for index in combiner.children.indices {
                // AGWeakAttributeGetAttribute를 호출하지 않고 있음 바로 Attribute를 가져오는 것으로 보임
                if combiner.children[index]._keys.base.attribute == keys.identifier {
                    result = true
                    return
                }
            }
            
            result = false
        }
        
        if result {
            viewGraph.graphInvalidation(from: isInvalidating ? nil : keys.identifier)
        }
    }
}

extension PreferenceBridge {
    struct BridgedPreference {
        private(set) var key: any PreferenceKey.Type
        private(set) var combiner: AnyWeakAttribute
    }
}

fileprivate struct MergePreferenceKeys: Rule, AsyncAttribute {
    @Attribute private(set) var lhs: PreferenceKeys
    @WeakAttribute var rhs: PreferenceKeys?
    
    typealias Value = PreferenceKeys
    
    var value: PreferenceKeys {
        assertUnimplemented()
    }
}
