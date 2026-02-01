public import Observation

@frozen @propertyWrapper public struct State<Value>: DynamicProperty {
    @usableFromInline
    internal var _value: Value
    @usableFromInline
    internal var _location: AnyLocation<Value>?
    
    public init(wrappedValue value: Value) {
        _value = value
    }
    
    @usableFromInline
    internal init(wrappedValue thunk: @autoclosure @escaping () -> Value) where Value : AnyObject, Value : Observable {
        fatalError("TODO")
    }
    
    @_alwaysEmitIntoClient public init(initialValue value: Value) {
        _value = value
    }
    
    public var wrappedValue: Value {
        get {
            fatalError("TODO")
        }
        nonmutating set {
            fatalError("TODO")
        }
    }
    
    public var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
    
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
}

extension State: Sendable where Value: Sendable {
}

extension State where Value: ExpressibleByNilLiteral {
    @inlinable public init() {
        self.init(wrappedValue: nil)
    }
}
