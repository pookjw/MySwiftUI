#warning("TODO")
package import AttributeGraph

package struct PreferencesOutputs {
    private var preferences: [PreferencesOutputs.KeyValue] = []
    private(set) var debugProperties: _ViewDebug.Properties = []
    
    init() {}
    
    package subscript<T: PreferenceKey>(_ type: T.Type) -> Attribute<T.Value>? {
        get {
            var value: AnyAttribute?
            for preference in preferences {
                if preference.key == type {
                    value = preference.value
                    break
                }
            }
            
            return value.map { Attribute(identifier: $0) }
        }
        set {
            self[type] = newValue.map { $0.identifier }
        }
    }
    
    package subscript(anyKey: (any PreferenceKey.Type)) -> AnyAttribute? {
        get {
            for preference in preferences {
                if preference.key == anyKey {
                    return preference.value
                }
            }
            return nil
        }
        set {
            fatalError("TODO")
        }
        _modify {
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
