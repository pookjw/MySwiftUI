// (extension in SwiftUI):SwiftUI.StaticIf
struct StaticIf<Predicate, TrueBody, FalseBody> {
    var trueBody: TrueBody
    var falseBody: FalseBody
    
    init(_trueBody: TrueBody, _falseBody: FalseBody) {
        self.trueBody = _trueBody
        self.falseBody = _falseBody
    }
}

extension StaticIf: View, PrimitiveView where Predicate : ViewInputPredicate, TrueBody : View, FalseBody : View {
    
}

extension StaticIf: ViewModifier, PrimitiveViewModifier where Predicate : ViewInputPredicate, TrueBody : ViewModifier, FalseBody : ViewModifier {
    
}

extension StaticIf: Gesture, PrimitiveGesture where Predicate : ViewInputPredicate, TrueBody : Gesture, FalseBody : Gesture {
    // TODO
}
