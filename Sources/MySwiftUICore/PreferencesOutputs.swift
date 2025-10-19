#warning("TODO")
internal import AttributeGraph

struct PreferencesOutputs {
    private var preferences: [PreferencesOutputs.KeyValue] = []
    private(set) var debugProperties: _ViewDebug.Properties = []
    
    init() {}
    
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
