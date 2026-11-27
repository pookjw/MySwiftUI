package import AttributeGraph

@_spi(Internal) public struct _GestureOutputs<T> {
    var phase: Attribute<GesturePhase<T>>
    @OptionalAttribute private var _debugData: GestureDebug.Data?
    var preferences: PreferencesOutputs

    var debugData: Attribute<GestureDebug.Data>? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package init(phase: Attribute<GesturePhase<T>>) {
        assertUnimplemented()
    }
    
    subscript<V : PreferenceKey>(_ type: V.Type) -> Attribute<V.Value>? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    subscript(anyKey key: (any PreferenceKey.Type)) -> AnyAttribute? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    func setIndirectDependency(_ attribute: AnyAttribute?) {
        assertUnimplemented()
    }
    
    func detachIndirectOutputs() {
        assertUnimplemented()
    }
    
    func attachIndirectOutputs(_ other: _GestureOutputs<T>) {
        assertUnimplemented()
    }
    
    mutating func appendPreference<Key : PreferenceKey>(key: Key.Type, value: Attribute<Key.Value>) {
        assertUnimplemented()
    }
    
    func forEachPreference(_ body: (_ key: any PreferenceKey.Type, _ attribute: AnyAttribute) -> Void) {
        assertUnimplemented()
    }
    
    func overrideDefaultValues(_ other: _GestureOutputs<T>) {
        assertUnimplemented()
    }
    
    func withPhase<A>(_ phase: Attribute<GesturePhase<A>>) -> _GestureOutputs<A> {
        assertUnimplemented()
    }
}
