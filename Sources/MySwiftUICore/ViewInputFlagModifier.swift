package struct ViewInputFlagModifier<T>: ViewModifier, PrimitiveViewModifier, _GraphInputsModifier {
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
    
    package var flag: T
    
    package init(flag: T) {
        self.flag = flag
    }
}
