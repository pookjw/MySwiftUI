public struct PlaceholderContentView<Value>: View {
    public nonisolated static func _makeView(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Swift.Int? {
        fatalError("TODO")
    }
    
    public typealias Body = Never
}

extension PlaceholderContentView: PrimitiveView {}

@available(*, unavailable)
extension PlaceholderContentView: Sendable {
}
