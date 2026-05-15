// D9F7AF928092578A4B8FA861B49E2161
internal import MySwiftUICore
private import AttributeGraph

protocol ViewAlias : PrimitiveView {
    init()
}

extension ViewAlias {
    nonisolated public static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         view -> x0 -> x29 - 0x98
         inputs -> x1 -> x26
         */
        // x23
        var copy_1 = inputs
        // x29 - 0x70
        let pop = copy_1.base.popLast(SourceInput<Self>.self)
        
        if let pop {
            copy_1.base.resetCurrentStyleableView()
            return pop.formula.makeViewList(view: view, source: pop, inputs: copy_1)
        } else {
            return _ViewListOutputs.emptyViewList(inputs: inputs)
        }
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

fileprivate struct StaticSourceWriter<T, U : View> : PrimitiveViewModifier, _GraphInputsModifier {
    private(set) var source: U
    
    static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        let sourceAttribute = modifier[{ .of(&$0.source) }]
        let value = AnyWeakAttribute(sourceAttribute.value.identifier)
        
        let source = AnySource(
            formula: SourceFormula<U>.self,
            value: value,
            valueIsNil: nil
        )
        
        inputs.append(source, to: SourceInput<U>.self)
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

fileprivate protocol AnySourceFormula {
    static func makeView<T : ViewAlias>(view: _GraphValue<T>, source: AnySource, inputs: _ViewInputs) -> _ViewOutputs
    static func makeViewList<T : ViewAlias>(view: _GraphValue<T>, source: AnySource, inputs: _ViewListInputs) -> _ViewListOutputs
    static func viewListCount(source: AnySource, inputs: _ViewListCountInputs) -> Int?
}

fileprivate struct AnySource : GraphReusable {
    let formula: any AnySourceFormula.Type
    private var value: AnyWeakAttribute
    private let valueIsNil: Attribute<Bool>?
    
    init<T : View>(_ input: Attribute<T?>) {
        assertUnimplemented()
    }
    
    @inline(always)
    init(formula: any AnySourceFormula.Type, value: AnyWeakAttribute, valueIsNil: Attribute<Bool>?) {
        self.formula = formula
        self.value = value
        self.valueIsNil = valueIsNil
    }
    
    func makeReusable(indirectMap: IndirectAttributeMap) {
        assertUnimplemented()
    }
    
    func tryToReuse(by: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
    
    static var isTriviallyReusable: Bool {
        assertUnimplemented()
    }
}

extension AnySource {
    struct IsNil<T> : Rule, AsyncAttribute {
        @Attribute var input: T?
        
        var value: Bool {
            assertUnimplemented()
        }
    }
}

fileprivate struct SourceFormula<U> : AnySourceFormula {
    static func makeView<T : ViewAlias>(view: _GraphValue<T>, source: AnySource, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeViewList<T : ViewAlias>(view: _GraphValue<T>, source: AnySource, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    static func viewListCount(source: AnySource, inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct SourceInput<T> : ViewInput {
    static var defaultValue: Stack<AnySource> {
        return Stack()
    }
}
