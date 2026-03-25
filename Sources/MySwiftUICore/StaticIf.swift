extension View {
    package func staticIf<Predicate: ViewInputPredicate, TrueBody: View, FalseBody: View>(
        _ predicate: Predicate,
        then: (Self) -> TrueBody,
        else: (Self) -> FalseBody
    ) -> some View {
        assertUnimplemented()
    }
    
    package func staticIf<Predicate: ViewInputPredicate, Content: View>(
        _ predicate: Predicate.Type,
        then: (Self) -> Content
    ) -> some View {
        assertUnimplemented()
    }
    
    package func staticIf<Predicate: ViewInputPredicate, Content: View>(_: Predicate, then: (Self) -> Content) -> some View {
        assertUnimplemented()
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
    package init(_ predicate: Predicate.Type, then: () -> TrueBody, else: () -> FalseBody) {
        self.trueBody = then()
        self.falseBody = `else`()
    }
    
    package init(_: Predicate, then: () -> TrueBody, else: () -> FalseBody) {
        self.trueBody = then()
        self.falseBody = `else`()
    }
    
    package init(_ predicate: Predicate.Type, then: () -> TrueBody) where FalseBody == EmptyView {
        assertUnimplemented()
    }
    
    package init(_ predicate: Predicate, then: () -> TrueBody) where FalseBody == EmptyView {
        assertUnimplemented()
    }
    
    package static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    package static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
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
        assertUnimplemented()
    }
    
    package init(_ predicate: Predicate.Type, then: TrueBody) where FalseBody == EmptyModifier {
        assertUnimplemented()
    }
    
    package init(_ predicate: Predicate, then: TrueBody) where FalseBody == EmptyModifier {
        assertUnimplemented()
    }
    
    package static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    package static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
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
