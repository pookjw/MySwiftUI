#warning("TODO")
internal import AttributeGraph

public struct _GraphValue<T>: Equatable {
    var value: Attribute<T>
    
    public static func == (lhs: _GraphValue<T>, rhs: _GraphValue<T>) -> Bool {
        fatalError("TODO")
    }
}
