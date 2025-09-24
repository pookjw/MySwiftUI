#warning("TODO")

@frozen
//@propertyWrapper
//@dynamicMemberLookup
public struct Binding<Value> {
    public var wrappedValue: Value {
        get {
            fatalError("TOOD")
        }
        nonmutating set {
            fatalError("TOOD")
        }
    }
    
    public static func constant(_ value: Value) -> Binding<Value> {
        fatalError("TOOD")
    }
    
    package init(value: Value, location: AnyLocation<Value>) {
        fatalError("TOOD")
    }
}
