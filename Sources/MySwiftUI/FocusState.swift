// 274D264A38B51DC68ACC48A91353B7D0
public import MySwiftUICore

@frozen
@propertyWrapper
public struct FocusState<Value> : DynamicProperty where Value : Hashable {
    @frozen
    @propertyWrapper
    public struct Binding {
        private var _binding: MySwiftUICore.Binding<Value>
        
        public var wrappedValue: Value {
            get {
                assertUnimplemented()
            }
            nonmutating set {
                assertUnimplemented()
            }
        }
        
        public var projectedValue: FocusState<Value>.Binding {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var wrappedValue: Value
    
    public var projectedValue: FocusState<Value>.Binding {
        assertUnimplemented()
    }

    public static func _makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
    
    public init() where Value == Bool {
        assertUnimplemented()
    }
    
    public init<T>() where Value == T?, T : Hashable {
        assertUnimplemented()
    }
}
