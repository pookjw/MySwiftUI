#warning("TODO")
package import AttributeGraph

public struct _ViewOutputs {
    package internal(set) var preferences = PreferencesOutputs()
    @OptionalAttribute var layoutComputer: LayoutComputer?
    
    init() {
        self._layoutComputer = OptionalAttribute()
    }
    
    package subscript<Key: PreferenceKey>(_ key: Key.Type) -> Attribute<Key.Value>? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    package subscript(anyKey: (any PreferenceKey.Type)) -> AnyAttribute? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
}

@available(*, unavailable)
extension _ViewOutputs: Sendable {}
