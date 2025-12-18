
package protocol ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool
    static func evaluate(listInputs: _ViewListInputs) -> Bool
}

extension ViewInputPredicate {
    package static func evaluate(listInputs: _ViewListInputs) -> Bool {
        fatalError("TODO")
    }
}
