struct IsVisionEnabledPredicate : ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool {
        let idiom = inputs[InterfaceIdiomInput.self] ?? AnyInterfaceIdiom(idiom: .phone)
        return AnyInterfaceIdiom(idiom: .vision) == idiom
    }
    
    init() {}
}
