// DC167C463E6601B3880A23A75ACAA63B

extension View {
    static nonisolated func makeImplicitRoot(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

fileprivate struct MakeViewRoot: _VariadicView_ImplicitRootVisitor {
    private var inputs: _ViewInputs
    private var body: (_Graph, _ViewInputs) -> _ViewListOutputs
    private var outputs: _ViewOutputs?
}

protocol _VariadicView_ImplicitRootVisitor {
//    func visit<T: _VariadicView_ImplicitRoot>(type: T.Type)
}
