
@frozen public struct EmptyView: PrimitiveView {
    @inlinable public nonisolated init() {}
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<EmptyView>, inputs: _ViewInputs) -> _ViewOutputs {
        return _ViewOutputs()
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<EmptyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}
