#warning("TODO")
internal import AttributeGraph

package struct PreferencesInputs {
    var keys: PreferenceKeys
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
    
    mutating func remove<T: PreferenceKey>(_ key: T.Type) {
        remove(key)
    }
    
    mutating func remove(_ key: any PreferenceKey.Type) {
        keys.remove(key)
    }
    
    func makeIndirectOutputs() -> PreferencesOutputs {
        // x29 = sp + 0xa0
        // self = x19
        // empty = sp + 0x1c
        // sp + 0x40
        var outputs = PreferencesOutputs()
        
        for key in keys {
            func wrap<Key: PreferenceKey>(key: Key.Type) {
                let attribute = GraphHost.currentHost.intern(key.defaultValue, for: key.self, id: .preferenceKeyDefault)
                let indirect = IndirectAttribute(source: attribute)
                outputs.appendPreference(key: key, value: indirect.identifier)
            }
            
            wrap(key: key)
        }
        
        return outputs
    }
}
