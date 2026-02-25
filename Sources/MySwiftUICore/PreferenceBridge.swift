private import AttributeGraph

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
        fatalError("TODO")
    }
}

extension PreferenceBridge {
    struct BridgedPreference {
        private var key: any PreferenceKey.Type
        private var combiner: AnyWeakAttribute
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
