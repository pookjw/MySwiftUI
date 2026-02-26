internal import AttributeGraph

@safe package final class PreferenceBridge {
    private(set) weak var viewGraph: ViewGraph? = nil // 0x10
    private var isValid: Bool = false // 0x18
    private var children: [Unmanaged<ViewGraph>] = [] // 0x20
    private var requestedPreferences = PreferenceKeys() // 0x28
    private(set) var bridgedViewInputs = PropertyList() // 0x30
    @WeakAttribute private var hostPreferenceKeys: PreferenceKeys? // 0x38
    @WeakAttribute private var hostPreferencesCombiner: PreferenceValues? // 0x40
    private var bridgedPreferences: [PreferenceBridge.BridgedPreference] = [] // 0x48
    
    init() {
        // <+60>
        self.viewGraph = .current
    }
    
    func wrapInputs(_ inputs: inout _ViewInputs) {
        fatalError("TODO")
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
        let empty = AnyAttribute.empty
        
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
}

extension PreferenceBridge {
    struct BridgedPreference {
        private(set) var key: any PreferenceKey.Type
        private(set) var combiner: AnyWeakAttribute
    }
}

extension EnvironmentValues {
    package var preferenceBridge: PreferenceBridge? {
        get {
            return self[PreferenceBridgeKey.self].base
        }
        set {
            self[PreferenceBridgeKey.self] = WeakBox(newValue)
        }
    }
    
    fileprivate struct PreferenceBridgeKey: EnvironmentKey {
        static var defaultValue: WeakBox<PreferenceBridge> {
            return WeakBox(nil)
        }
    }
}
