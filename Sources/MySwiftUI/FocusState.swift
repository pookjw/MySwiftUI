public import MySwiftUICore

@frozen
@propertyWrapper
public struct FocusState<Value> : DynamicProperty {
    public var wrappedValue: Value
    
    public init() where Value == Bool {
        assertUnimplemented()
    }
    
    public init<T>() where Value == T?, T : Hashable {
        assertUnimplemented()
    }
}
