#warning("TODO")
internal import AttributeGraph

public struct _GraphValue<Value>: Equatable {
    var value: Attribute<Value>
    
    init(_ value: Attribute<Value>) {
        self.value = value
    }
    
    public subscript<U>(keyPath: KeyPath<Value, U>) -> _GraphValue<U> {
        get {
            fatalError("TODO")
        }
    }
    
    public static func == (lhs: _GraphValue<Value>, rhs: _GraphValue<Value>) -> Bool {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension _GraphValue: Sendable {}
