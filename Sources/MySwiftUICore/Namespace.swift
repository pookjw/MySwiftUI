
@frozen
@propertyWrapper
public struct Namespace: Sendable {
    @usableFromInline var id: Int
    
    public var wrappedValue: ID {
        fatalError("TODO")
    }
    
    @inlinable public init() {
        id = 0
    }
    
    package init(id: Int) {
        self.id = id
    }
    
    public static func makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: _GraphInputs) {
        fatalError("TODO")
    }
}

extension Namespace {
    @frozen public struct ID: Hashable {
        package var id: Int
        
        package init(id: Int) {
            self.id = id
        }
    }
}
