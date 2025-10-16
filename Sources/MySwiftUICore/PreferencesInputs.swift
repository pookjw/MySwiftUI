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
}
