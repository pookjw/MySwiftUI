// B05A38AC07D1D9619F47AAB3A683746F

@propertyWrapper
struct LazyState<Value>: DynamicProperty {
    private var _storage: LazyState<Value>.Storage
    private var _location: AnyLocation<Value>? = nil
    
    init(wrappedValue: @autoclosure @escaping () -> Value) {
        _storage = .thunk(wrappedValue)
    }
    
    var wrappedValue: Value {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    fileprivate func getValue(forReading: Bool) -> Value {
        fatalError("TODO")
    }
    
    var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
    
    static func _makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
}

extension LazyState {
    enum Storage {
        case thunk(() -> Value)
        case value(Value)
    }
}

@propertyWrapper
struct LazyState2<Value>: DynamicProperty {
    private let lazyState: LazyState<Value>
    
    init(wrappedValue: @autoclosure @escaping () -> Value) {
        lazyState = LazyState<Value>(wrappedValue: wrappedValue())
    }
    
    var wrappedValue: Value {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
}
