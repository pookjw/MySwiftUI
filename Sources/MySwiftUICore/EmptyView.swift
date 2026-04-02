
@frozen public struct EmptyView : PrimitiveView {
    @inlinable nonisolated public init() {}
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(view: _GraphValue<EmptyView>, inputs: _ViewInputs) -> _ViewOutputs {
        return _ViewOutputs()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<EmptyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}
