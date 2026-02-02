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
            return getValue(forReading: true)
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
    
    fileprivate func getValue(forReading: Bool) -> Value {
        // forReading -> x22
        if let location = _location {
            guard GraphHost.isUpdating else {
                // <+168>
                return location.get()
            }
            
            if forReading {
                location.wasReed = true
            }
        }
        
        // <+128>
        return _value
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
    
    mutating func update(property: inout State<Value>, phase: _GraphInputs.Phase) -> Bool {
        /*
         property -> x19
         */
        // x26
        let oldLocation = self.location
        // w25
        var updated = oldLocation == nil
        // x23
        let location: StoredLocation<Value>
        if let _location = oldLocation {
            location = _location
        } else {
            // <+100>
            if let _location = property._location as? StoredLocation<Value> {
                self.location = _location
                location = _location
            } else {
                // <+172>
                location = StoredLocation(
                    initialValue: property._value,
                    host: .currentHost,
                    signal: signal
                )
                
                self.location = location
            }
        }
        
        // <+276>
        let changedValue: (Void, Bool)? = signal.changedValue(options: [])
        property._value = location.updateValue
        property._location = location
        
        if let changedValue, changedValue.1 {
            updated = (oldLocation == nil) || location.wasReed
        }
        
        return updated
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        fatalError("TODO")
    }
}
