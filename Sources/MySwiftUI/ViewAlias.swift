// D9F7AF928092578A4B8FA861B49E2161
internal import MySwiftUICore
private import AttributeGraph

protocol ViewAlias : PrimitiveView {
    init()
}

extension ViewAlias {
    nonisolated public static func _makeView(view: _GraphValue<ViewAlias>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<ViewAlias>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

extension View {
    func viewAlias<T : ViewAlias, U : View>(_ type: T.Type, _ block: () -> U) -> some View {
        return self.modifier(StaticSourceWriter<T, U>(source: block()))
    }
    
    func viewAlias<T : ViewInputPredicate, U : ViewAlias, V : View>(if: T.Type, _: U.Type, source: () -> V) -> some View {
        assertUnimplemented()
    }
    
    func optionalViewAlias<T : ViewAlias, U : View>(_: T.Type, _ block: () -> U?) -> some View {
        assertUnimplemented()
    }
}

fileprivate struct StaticSourceWriter<T, U> : PrimitiveViewModifier, _GraphInputsModifier {
    private(set) var source: U
    
    static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}
