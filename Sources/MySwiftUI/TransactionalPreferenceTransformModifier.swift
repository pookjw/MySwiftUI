internal import MySwiftUICore

struct TransactionalPreferenceTransformModifier<T : PreferenceKey> : PrimitiveViewModifier, MultiViewModifier {
    var transform: (inout T.Value, Transaction) -> Void
    
    nonisolated static func _makeView(modifier: _GraphValue<TransactionalPreferenceTransformModifier<T>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}
