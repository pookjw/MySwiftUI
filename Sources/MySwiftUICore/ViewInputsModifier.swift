package protocol ViewInputsModifier: ViewModifier {
    static var graphInputsSemantics: Semantics? { get }
    static nonisolated func _makeViewInputs(modifier: _GraphValue<Self>, inputs: inout _ViewInputs)
}

extension ViewInputsModifier {
    package static var graphInputsSemantics: Semantics? {
        assertUnimplemented()
    }
    
    package static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var copy = inputs
        Self._makeViewInputs(modifier: modifier, inputs: &copy)
        return body(_Graph(), copy)
    }
    
    package static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    package static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}
