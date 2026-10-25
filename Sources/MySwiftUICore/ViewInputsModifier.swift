private import AttributeGraph

package protocol ViewInputsModifier : ViewModifier {
    nonisolated static var graphInputsSemantics: Semantics? { get }
    nonisolated static func _makeViewInputs(modifier: _GraphValue<Self>, inputs: inout _ViewInputs)
}

extension ViewInputsModifier {
    package static var graphInputsSemantics: Semantics? {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var copy = inputs
        Self._makeViewInputs(modifier: modifier, inputs: &copy)
        return body(_Graph(), copy)
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w28
         inputs -> x1 -> x23
         body -> x2/x3 -> x21/x22
         return pointer -> x8 -> x19
         */
        if let graphInputsSemantics, isLinkedOnOrAfter(graphInputsSemantics) {
            // <+240>
            var viewInputs = _ViewInputs(
                inputs.base,
                position: Attribute(identifier: .empty),
                size: Attribute(identifier: .empty),
                transform: Attribute(identifier: .empty),
                containerPosition: Attribute(identifier: .empty),
                hostPreferenceKeys: Attribute(identifier: .empty)
            )
            
            self._makeViewInputs(modifier: modifier, inputs: &viewInputs)
            
            var inputs = inputs
            inputs.base = viewInputs.base
            
            return body(_Graph(), inputs)
        } else {
            // <+92>
            var outputs = body(_Graph(), inputs)
            outputs.multiModifier(modifier, inputs: inputs)
            return outputs
        }
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}
