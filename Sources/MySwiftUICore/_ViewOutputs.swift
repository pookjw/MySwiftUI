#warning("TODO")
package import AttributeGraph

public struct _ViewOutputs {
    package internal(set) var preferences = PreferencesOutputs()
    var _layoutComputer: OptionalAttribute<LayoutComputer>
    var layoutComputer: Attribute<LayoutComputer>? {
        get {
            return _layoutComputer.attribute
        }
        set {
            _layoutComputer = OptionalAttribute(newValue)
            preferences.debugProperties.insert(.layoutComputer)
        }
    }
    
    init() {
        self._layoutComputer = OptionalAttribute()
    }
    
    package subscript<Key: PreferenceKey>(_ key: Key.Type) -> Attribute<Key.Value>? {
        get {
            return preferences[key]
        }
        set {
            preferences[key] = newValue
        }
    }
    
    package subscript(anyKey: (any PreferenceKey.Type)) -> AnyAttribute? {
        get {
            return preferences[anyKey]
        }
        set {
            preferences[anyKey] = newValue
        }
        _modify {
            yield &preferences[anyKey]
        }
    }
}

@available(*, unavailable)
extension _ViewOutputs: Sendable {}
