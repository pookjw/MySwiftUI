
package protocol ViewInput: GraphInput {
}

extension ViewInput where Self: ViewInputFlag {
    package typealias Input = Self
}

package protocol ViewInputFlag: _GraphInputsModifier, ViewInputPredicate {
    associatedtype Input: ViewInput
    
    static var value: Input.Value {
        get
    }
    init()
}

extension ViewInputFlag {
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        fatalError("TODO")
    }
    
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
}

package protocol ViewInputBoolFlag: ViewInput, ViewInputFlag where Value == Bool {
}

extension ViewInputBoolFlag {
    package static var value: Bool {
        return true
    }
    
    package static var defaultValue: Bool {
        return false
    }
}
