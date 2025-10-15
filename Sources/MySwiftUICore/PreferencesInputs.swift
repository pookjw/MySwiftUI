#warning("TODO")
internal import AttributeGraph

struct PreferencesInputs {
    var keys: PreferenceKeys
    private(set) var hostKeys: Attribute<PreferenceKeys>
    
    init(keys: PreferenceKeys, hostKeys: Attribute<PreferenceKeys>) {
        self.keys = keys
        self.hostKeys = hostKeys
    }
}
