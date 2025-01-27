@propertyWrapper
package final class MutableBox<Value> {
    package var wrappedValue: Value {
        get {
            value
        }
        set {
            value = newValue
        }
    }
    
    package var projectedValue: MutableBox<Value> {
        self
    }
    
    package var value: Value
    
    package init(value: Value) {
        self.value = value
    }
}

extension MutableBox: Equatable where Value : Equatable {
    package static func == (lhs: MutableBox<Value>, rhs: MutableBox<Value>) -> Bool {
        lhs.value == rhs.value
    }
}
