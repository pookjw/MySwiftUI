extension View {
    @inlinable nonisolated public func transformPreference<K>(_ key: K.Type = K.self, _ callback: @escaping (inout K.Value) -> Void) -> some View where K : PreferenceKey {
        return modifier(_PreferenceTransformModifier<K>(transform: callback))
    }
}

@frozen public struct _PreferenceTransformModifier<Key> : ViewModifier where Key : PreferenceKey {
    @safe public nonisolated(unsafe) var transform: (inout Key.Value) -> Void
    
    public typealias Body = Never
    
    @inlinable public nonisolated init(key _: Key.Type = Key.self, transform: @escaping (inout Key.Value) -> Void) {
        self.transform = transform
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_PreferenceTransformModifier<Key>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w24
         inputs -> x1
         body -> x2/x3
         */
        // sp + 0x30
        let copy_1 = inputs
        var outputs = body(_Graph(), copy_1)
        outputs.preferences.makePreferenceTransformer(inputs: copy_1.preferences, key: Key.self, transform: modifier.value.transform)
        return outputs
    }
}

@available(*, unavailable)
extension _PreferenceTransformModifier : Sendable {
}

extension _PreferenceTransformModifier : MultiViewModifier, PrimitiveViewModifier {}
