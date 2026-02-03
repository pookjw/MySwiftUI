public protocol _GraphInputsModifier {
    static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs)
}

extension ViewModifier where Self : _GraphInputsModifier, Body == Never {
    public static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         body -> x19/x21
         return pointer -> x22
         */
        // sp + 0xc0
        let copy_1 = inputs
        // sp + 0x60
        var copy_2 = inputs
        // modifier -> sp + 0x180
        // sp + 0x1e0
        let _ = copy_1
        
        // <+136>
        Self._makeInputs(modifier: modifier, inputs: &copy_2.base)
        
        // sp + 0x120
        let copy_4 = copy_2
        // sp
        let _ = copy_2
        // sp + 0x1e0
        let copy_6 = copy_4
        return body(_Graph(), copy_6)
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}
