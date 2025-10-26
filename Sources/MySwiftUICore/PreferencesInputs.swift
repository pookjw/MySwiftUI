#warning("TODO")
internal import AttributeGraph

package struct PreferencesInputs {
    private var keys: PreferenceKeys
    private(set) var hostKeys: Attribute<PreferenceKeys>
    
    init(keys: PreferenceKeys, hostKeys: Attribute<PreferenceKeys>) {
        self.keys = keys
        self.hostKeys = hostKeys
    }
    
    package mutating func add<Key: PreferenceKey>(_ key: Key.Type) {
        keys.add(key)
    }
    
    package func contains<Key: PreferenceKey>(_ key: Key.Type) -> Bool {
        return contains(key, includeHostPreferences: false)
    }
    
    package func contains<Key: PreferenceKey>(_ key: Key.Type, includeHostPreferences: Bool) -> Bool {
        if keys.contains(key) {
            return true
        } else {
            if key._isReadableByHost {
                // <+120>
                return keys.contains(HostPreferencesKey.self)
            } else {
                return false
            }
        }
    }
    
    func makeIndirectOutputs() -> PreferencesOutputs {
        fatalError("TODO")
    }
}
