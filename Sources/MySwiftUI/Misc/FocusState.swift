#warning("TODO")
public import MySwiftUICore

@frozen
@propertyWrapper
public struct FocusState<Value>: DynamicProperty {
    public var wrappedValue: Value
    
    public init() where Value == Bool {
        fatalError("TODO")
    }
    
    public init<T>() where Value == T?, T: Hashable {
        fatalError("TODO")
    }
}
