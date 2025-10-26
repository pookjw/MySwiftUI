#warning("TODO")
package import AttributeGraph

package struct PreferencesOutputs {
    private var preferences: [PreferencesOutputs.KeyValue] = []
    var debugProperties: _ViewDebug.Properties = []
    
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
            if anyKey == DisplayList.Key.self {
                debugProperties.insert(.displayList)
            }
            
            if let index = preferences.firstIndex(where: { $0.key == anyKey }) {
                if let newValue {
                    preferences[index].value = newValue
                } else {
                    preferences.remove(at: index)
                }
            } else {
                newValue.map {
                    preferences.append(KeyValue(key: anyKey, value: $0))
                }
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    @inline(__always)
    func setIndirectDependency(_ attribute: AnyAttribute?) {
        for preference in preferences {
            preference.value.indirectDependency = attribute
        }
    }
    
    @inline(__always)
    func detachIndirectOutputs() {
        setIndirectDependency(.empty)
    }
    
    @inline(__always)
    func attachIndirectOutputs(to other: PreferencesOutputs) {
        fatalError("TODO")
    }
    
    mutating func appendPreference<Key: PreferenceKey>(key: Key.Type, value: Attribute<Key.Value>) {
        /*
         self = x23
         x22 = key
         x19 = value
         x21 = witness
         */
        let keyValue = KeyValue(key: key, value: value.identifier)
        preferences.append(keyValue)
    }
}

extension PreferencesOutputs {
    fileprivate struct KeyValue {
        var key: PreferenceKey.Type
        var value: AnyAttribute
    }
}
