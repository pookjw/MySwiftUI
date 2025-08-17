#warning("TODO")
internal import AttributeGraph

package struct PreferencesInputs {
    var keys: PreferenceKeys
    var hostKeys: Attribute<PreferenceKeys>
}

struct PreferenceKeys {
    var keys: [(any PreferenceKey).Type]
}

package protocol PreferenceKey {
    associatedtype Value
    
    static var defaultValue: Value {
        get
    }
}
