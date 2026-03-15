package protocol StyleModifier: MultiViewModifier, PrimitiveViewModifier {
    associatedtype Style
    associatedtype StyleConfiguration
    associatedtype StyleBody : View
    
    var style: Self.Style { get set }
    init(style: Self.Style)
    func styleBody(configuration: Self.StyleConfiguration) -> Self.StyleBody
}

extension StyleModifier {
    package nonisolated static func _makeViewList(modifier: _GraphValue<StyleModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    package nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    package nonisolated static func _makeView(modifier: _GraphValue<StyleModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}
