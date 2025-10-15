#warning("TODO")
internal import AttributeGraph

struct PreferencesOutputs {
    private var preferences: [PreferencesOutputs.KeyValue]
    private var debugProperties: _ViewDebug.Properties
    
    subscript<T: PreferenceKey>(_ type: T.Type) -> Attribute<T.Value>? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

extension PreferencesOutputs {
    fileprivate struct KeyValue {
        var key: PreferenceKey.Type
        var value: AnyAttribute
    }
}
