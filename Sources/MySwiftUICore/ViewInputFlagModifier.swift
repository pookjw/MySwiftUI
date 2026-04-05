package struct ViewInputFlagModifier<T: _GraphInputsModifier>: ViewModifier, PrimitiveViewModifier, _GraphInputsModifier {
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        let value = modifier[{ .of(&$0.flag)} ]
        T._makeInputs(modifier: value, inputs: &inputs)
    }
    
    package var flag: T
    
    package init(flag: T) {
        self.flag = flag
    }
}
