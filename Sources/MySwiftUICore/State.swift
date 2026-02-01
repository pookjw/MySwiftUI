// F6975D1F800AFE6093C23B3DBD777BCF
public import Observation
private import AttributeGraph

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
        let attribute = Attribute(value: ())
        let signal = WeakAttribute(attribute)
        let box = StatePropertyBox<Value>(signal: signal, location: nil)
        buffer.append(box, fieldOffset: fieldOffset)
        
        if Subgraph.shouldRecordTree {
            addTreeValueSlow(attribute.identifier, as: Value.self, in: V.self, fieldOffset: fieldOffset, flags: .stateSignal)
        }
    }
}

extension State: Sendable where Value: Sendable {
}

extension State where Value: ExpressibleByNilLiteral {
    @inlinable public init() {
        self.init(wrappedValue: nil)
    }
}

fileprivate struct StatePropertyBox<Value>: DynamicPropertyBox {
    let signal: WeakAttribute<Void>
    var location: StoredLocation<Value>?
    
    func destroy() {
        fatalError("TODO")
    }
    
    func reset() {
        fatalError("TODO")
    }
    
    func update(property: inout State<Value>, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        fatalError("TODO")
    }
}
