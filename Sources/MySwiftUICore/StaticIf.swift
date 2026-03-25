extension View {
    package func staticIf<Predicate: ViewInputPredicate, TrueBody: View, FalseBody: View>(
        _ predicate: Predicate,
        @ViewBuilder then: (Self) -> TrueBody,
        @ViewBuilder else: (Self) -> FalseBody
    ) -> some View {
        return StaticIf(
            predicate,
            then: {
                return then(self)
            },
            else: {
                return `else`(self)
            }
        )
    }
    
    package func staticIf<Predicate: ViewInputPredicate, Content: View>(
        _ predicate: Predicate.Type,
        @ViewBuilder then: (Self) -> Content
    ) -> some View {
        return StaticIf(
            predicate,
            then: {
                return then(self)
            },
            else: {
                return self
            }
        )
    }
    
    package func staticIf<Predicate: ViewInputPredicate, Content: View>(
        _ type: Predicate,
        @ViewBuilder then: (Self) -> Content
    ) -> some View {
        return StaticIf(
            type,
            then: {
                return then(self)
            },
            else: {
                return self
            }
        )
    }
}

package struct StaticIf<Predicate, TrueBody, FalseBody> {
    package var trueBody: TrueBody
    package var falseBody: FalseBody
    
    package init(_trueBody: TrueBody, _falseBody: FalseBody) {
        self.trueBody = _trueBody
        self.falseBody = _falseBody
    }
}

extension StaticIf: View, PrimitiveView where Predicate: ViewInputPredicate, TrueBody: View, FalseBody: View {
    package init(
        _ predicate: Predicate.Type,
        @ViewBuilder then: () -> TrueBody,
        @ViewBuilder else: () -> FalseBody
    ) {
        self.trueBody = then()
        self.falseBody = `else`()
    }
    
    package init(
        _: Predicate,
        @ViewBuilder then: () -> TrueBody,
        @ViewBuilder else: () -> FalseBody
    ) {
        self.trueBody = then()
        self.falseBody = `else`()
    }
    
    package init(
        _ predicate: Predicate.Type,
        @ViewBuilder then: () -> TrueBody
    ) where FalseBody == EmptyView {
        self.trueBody = then()
        self.falseBody = EmptyView()
    }
    
    package init(
        _ predicate: Predicate,
        @ViewBuilder then: () -> TrueBody
    ) where FalseBody == EmptyView {
        self.trueBody = then()
        self.falseBody = EmptyView()
    }
    
    package static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> w21
         inputs -> x1
         */
        let result = Predicate.evaluate(inputs: inputs.base)
        
        if result {
            // <+212>
            let resolved = view[{ .of(&$0.trueBody)} ]
            return TrueBody.makeDebuggableView(view: resolved, inputs: inputs)
        } else {
            // <+520>
            let resolved = view[{ .of(&$0.falseBody)} ]
            return FalseBody.makeDebuggableView(view: resolved, inputs: inputs)
        }
    }
    
    package static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let result = Predicate.evaluate(inputs: inputs.base)
        
        if result {
            let resolved = view[{ .of(&$0.trueBody)} ]
            return TrueBody.makeDebuggableViewList(view: resolved, inputs: inputs)
        } else {
            let resolved = view[{ .of(&$0.falseBody)} ]
            return FalseBody.makeDebuggableViewList(view: resolved, inputs: inputs)
        }
    }
    
    package static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
//    init<Idiom: InterfaceIdiomProtocol>(idiom: Idiom, then: () -> TrueBody, else: () -> FalseBody) where Predicate == InterfaceIdiomPredicate<Idiom> {
//        assertUnimplemented()
//    }
//    
//    init<Idiom: InterfaceIdiomProtocol>(idiom: Idiom, then: () -> TrueBody) where Predicate == InterfaceIdiomPredicate<Idiom>, FalseBody == EmptyView {
//        assertUnimplemented()
//    }
//    
//    init<Context: StyleContext>(in context: Context, then: () -> TrueBody, else: () -> FalseBody) where Predicate == StyleContextAcceptsPredicate<Context> {
//        assertUnimplemented()
//    }
//    
//    init<Context: StyleContext>(in context: Context, then: () -> TrueBody) where Predicate == StyleContextAcceptsPredicate<Context>, FalseBody == EmptyView {
//        assertUnimplemented()
//    }
//    
//    init<each Context>(any contexts: repeat each Context, then: () -> TrueBody, else: () -> FalseBody) where Predicate == StyleContextAcceptsAnyPredicate<(repeat each Context)>, repeat each Context: StyleContext {
//        assertUnimplemented()
//    }
//    
//    init<each Context>(any contexts: repeat each Context, then: () -> TrueBody) where Predicate == StyleContextAcceptsAnyPredicate<(repeat each Context)>, FalseBody == EmptyView, repeat each Context: StyleContext {
//        assertUnimplemented()
//    }
//    
//    init<each Context>(_ contexts: repeat each Context, then: () -> TrueBody, else: () -> FalseBody) where Predicate == StyleContextAcceptsPredicate<(repeat each Context)>, repeat each Context: StyleContext {
//        assertUnimplemented()
//    }
//    
//    init<each Context>(_ contexts: repeat each Context, then: () -> TrueBody) where Predicate == StyleContextAcceptsPredicate<(repeat each Context)>, FalseBody == EmptyView, repeat each Context: StyleContext {
//        assertUnimplemented()
//    }
//    
//    init<Semantic: SemanticProtocol>(isLinkedOnOrAfter semantic: Semantic, then: () -> TrueBody, else: () -> FalseBody) where Predicate == SemanticsIsLinkedOnOrAfter<Semantic> {
//        assertUnimplemented()
//    }
//    
//    init<Semantic: SemanticProtocol>(isLinkedOnOrAfter semantic: Semantic, then: () -> TrueBody) where Predicate == SemanticsIsLinkedOnOrAfter<Semantic>, FalseBody == EmptyView {
//        assertUnimplemented()
//    }
}

extension StaticIf: ViewModifier, PrimitiveViewModifier where Predicate : ViewInputPredicate, TrueBody : ViewModifier, FalseBody : ViewModifier {
    package init(_ predicate: Predicate.Type, then: TrueBody, else: FalseBody) {
        self.trueBody = then
        self.falseBody = `else`
    }
    
    package init(_ predicate: Predicate.Type, then: TrueBody) where FalseBody == EmptyModifier {
        self.trueBody = then
        self.falseBody = EmptyModifier()
    }
    
    package init(_ predicate: Predicate, then: TrueBody) where FalseBody == EmptyModifier {
        self.trueBody = then
        self.falseBody = EmptyModifier()
    }
    
    package static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let result = Predicate.evaluate(inputs: inputs.base)
        
        if result {
            let resolved = modifier[{ .of(&$0.trueBody)} ]
            return TrueBody.makeDebuggableView(modifier: resolved, inputs: inputs, body: body)
        } else {
            let resolved = modifier[{ .of(&$0.falseBody)} ]
            return FalseBody.makeDebuggableView(modifier: resolved, inputs: inputs, body: body)
        }
    }
    
    package static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        let result = Predicate.evaluate(inputs: inputs.base)
        
        if result {
            let resolved = modifier[{ .of(&$0.trueBody)} ]
            return TrueBody.makeDebuggableViewList(modifier: resolved, inputs: inputs, body: body)
        } else {
            let resolved = modifier[{ .of(&$0.falseBody)} ]
            return FalseBody.makeDebuggableViewList(modifier: resolved, inputs: inputs, body: body)
        }
    }
    
    package static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
//    init<Idiom: InterfaceIdiomProtocol>(idiom: Idiom, then: TrueBody, else: FalseBody) where Predicate == InterfaceIdiomPredicate<Idiom> {
//        assertUnimplemented()
//    }
//    
//    init<Idiom: InterfaceIdiomProtocol>(idiom: Idiom, then: TrueBody) where Predicate == InterfaceIdiomPredicate<Idiom>, FalseBody == EmptyModifier {
//        assertUnimplemented()
//    }
//    
//    init<Context: StyleContext>(in context: Context, then: TrueBody, else: FalseBody) where Predicate == StyleContextAcceptsPredicate<Context> {
//        assertUnimplemented()
//    }
//    
//    init<Semantic: SemanticProtocol>(isLinkedOnOrAfter semantic: Semantic, then: TrueBody, else: FalseBody) where Predicate == SemanticsIsLinkedOnOrAfter<Semantic> {
//        assertUnimplemented()
//    }
//    
//    init<Semantic: SemanticProtocol>(isLinkedOnOrAfter semantic: Semantic, then: TrueBody) where Predicate == SemanticsIsLinkedOnOrAfter<Semantic>, FalseBody == EmptyModifier {
//        assertUnimplemented()
//    }
}

//extension StaticIf: Gesture, PrimitiveGesture where Predicate : ViewInputPredicate, TrueBody : Gesture, FalseBody : Gesture, TrueBody.Value == FalseBody.Value {
//    package init(_ predicate: Predicate.Type, then: () -> TrueBody, else: () -> FalseBody) {
//        assertUnimplemented()
//    }
//    
//    package static func _makeGesture(gesture: _GraphValue<Self>, inputs: _GestureInputs) -> _GestureOutputs<TrueBody.Value> {
//        assertUnimplemented()
//    }
//}

//extension StaticIf: ToolbarContent where Predicate: ViewInputPredicate, TrueBody: ToolbarContent, FalseBody: ToolbarContent {
//    init(_ predicate: Predicate.Type, then: () -> TrueBody, else: () -> FalseBody) {
//        assertUnimplemented()
//    }
//    
//    init(_ predicate: Predicate, then: () -> TrueBody, else: () -> FalseBody) {
//        assertUnimplemented()
//    }
//    
//    init(_ predicate: Predicate.Type, then: () -> TrueBody) where FalseBody == EmptyToolbarContent {
//        assertUnimplemented()
//    }
//    
//    init(_ predicate: Predicate, then: () -> TrueBody) where FalseBody == EmptyToolbarContent {
//        assertUnimplemented()
//    }
//    
//    static func _makeToolbar(content: _GraphValue<Self>, inputs: _ToolbarInputs) -> _ToolbarOutputs {
//        assertUnimplemented()
//    }
//}
