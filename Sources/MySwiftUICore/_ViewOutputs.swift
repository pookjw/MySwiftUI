#warning("TODO")
package import AttributeGraph

public struct _ViewOutputs {
    package internal(set) var preferences = PreferencesOutputs()
    private var _layoutComputer: OptionalAttribute<LayoutComputer>
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
    
    // 원래 없음
    @inline(__always)
    init(preferences: PreferencesOutputs, layoutComputer: OptionalAttribute<LayoutComputer>) {
        self.preferences = preferences
        self._layoutComputer = layoutComputer
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
    
    @inline(__always)
    func detachIndirectOutputs() {
        preferences.detachIndirectOutputs()
        if let layoutComputer {
            layoutComputer.identifier.indirectAttribute = .empty
        }
    }
    
    @inline(__always)
    func setIndirectDependency(_ attribute: AnyAttribute?) {
        preferences.setIndirectDependency(attribute)
        if let layoutComputer {
            layoutComputer.identifier.indirectDependency = attribute
        }
    }
    
    @inline(__always)
    func attachIndirectOutputs(to other: _ViewOutputs) {
        self.preferences.attachIndirectOutputs(to: other.preferences)
        if let layoutComputer, let otherLayoutComputer = other.layoutComputer {
            layoutComputer.identifier.indirectAttribute = otherLayoutComputer.identifier
        }
    }
}

@available(*, unavailable)
extension _ViewOutputs: Sendable {}
