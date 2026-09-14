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
        let transform = Attribute(
            IsAnimated<T>(
                modifier: modifier.value,
                transaction: inputs.transaction
            )
        )
        transform.flags = .transactional
        
        // x25
        var outputs = body(_Graph(), inputs)
        
        outputs.preferences.makePreferenceTransformer(
            inputs: inputs.preferences,
            key: T.self,
            transform: transform // $s7SwiftUI40TransactionalPreferenceTransformModifierV9_makeView8modifier6inputs4bodyAA01_H7OutputsVAA11_GraphValueVyACyxGG_AA01_H6InputsVAiA01_M0V_AOtctFZ09AttributeM00P0Vyy0N0QzzcGyXEfu_TA
        )
        
        return outputs
    }
}

fileprivate struct IsAnimated<T : PreferenceKey> : StatefulRule, CustomStringConvertible {
    @Attribute var modifier: TransactionalPreferenceTransformModifier<T>
    @Attribute var transaction: Transaction
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = (inout T.Value) -> Void
    
    func updateValue() {
        assertUnimplemented()
    }
}
