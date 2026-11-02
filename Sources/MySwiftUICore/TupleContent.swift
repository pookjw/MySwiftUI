// 99F7483FD5E72B0CC96AAE11DAE05002

struct TupleContent<each V> : View where repeat each V : View {
    private var content: (repeat each V)
    
    var body: Never {
        assertUnimplemented()
    }
    
    static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}
