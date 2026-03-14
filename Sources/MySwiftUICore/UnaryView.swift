
protocol UnaryView: View {
}

extension UnaryView {
    public nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return _ViewListOutputs.unaryViewList(view: view, inputs: inputs)
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

protocol UnaryViewModifier: ViewModifier {
}

extension UnaryViewModifier {
    static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}
