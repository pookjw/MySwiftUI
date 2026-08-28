public import MySwiftUICore

@frozen
@propertyWrapper
public struct FocusState<Value> : DynamicProperty {
    public var wrappedValue: Value

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
