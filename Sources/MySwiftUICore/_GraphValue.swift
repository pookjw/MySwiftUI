#warning("TODO")
internal import AttributeGraph

public struct _GraphValue<T>: Equatable {
    var value: Attribute<T>
    
    init(_ value: Attribute<T>) {
        self.value = value
    }
    
    public static func == (lhs: _GraphValue<T>, rhs: _GraphValue<T>) -> Bool {
        fatalError("TODO")
    }
}
