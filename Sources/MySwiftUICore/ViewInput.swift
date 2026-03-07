
package protocol ViewInput: GraphInput {
}

extension ViewInput where Self: ViewInputFlag {
    package typealias Input = Self
}

package protocol ViewInputFlag: _GraphInputsModifier, ViewInputPredicate {
    associatedtype Input: ViewInput where Input.Value: Equatable
    
    static var value: Input.Value {
        get
    }
    
    init()
}

extension ViewInputFlag {
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        // inputs -> x0 -> x20
        let value1 = inputs[Input.self]
        let value2 = value
        return value1 == value2
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
