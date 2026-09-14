// 118F5F06898F710FC0FEC394204027F7
internal import MySwiftUICore
private import AttributeGraph

struct TransactionalPreferenceTransformModifier<T : PreferenceKey> : PrimitiveViewModifier, MultiViewModifier {
    @safe nonisolated(unsafe) var transform: (inout T.Value, Transaction) -> Void
    
    nonisolated static func _makeView(modifier: _GraphValue<TransactionalPreferenceTransformModifier<T>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> x20
         inputs -> x1 -> x26
         body -> x2/x3 -> x29 - 0x108
         */
        // <+192>
        let attribute = Attribute(
            IsAnimated<T>(
                modifier: modifier.value,
                transaction: inputs.transaction
            )
        )
        
        assertUnimplemented()
    }
}

fileprivate struct IsAnimated<T : PreferenceKey> : StatefulRule, CustomStringConvertible {
    @Attribute var modifier: TransactionalPreferenceTransformModifier<T>
    @Attribute var transaction: Transaction
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = T.Value
    
    func updateValue() {
        assertUnimplemented()
    }
}
