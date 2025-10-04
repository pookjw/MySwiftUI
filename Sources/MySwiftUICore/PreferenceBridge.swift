#warning("TODO")
private import AttributeGraph

@safe package final class PreferenceBridge {
    private(set) weak var viewGraph: ViewGraph?
    private var isValid: Bool
    private var children: [Unmanaged<ViewGraph>]
    private var requestedPreferences: PreferenceKeys
    private var bridgedViewInputs: PropertyList
    @WeakAttribute private var hostPreferenceKeys: PreferenceKeys?
    @WeakAttribute private var hostPreferencesCombiner: PreferenceValues?
    private var bridgedPreferences: [PreferenceBridge.BridgedPreference]
    
    init() {
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
