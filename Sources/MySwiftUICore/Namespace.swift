private import os.log
private import AttributeGraph

@frozen
@propertyWrapper
public struct Namespace : Sendable {
    @usableFromInline var id: Int
    
    public var wrappedValue: Namespace.ID {
        if self.id == 0 {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Reading a Namespace property outside View.body. This will result in identifiers that never match any other identifier.")
            return Namespace.ID(id: AGMakeUniqueID())
        } else {
            return Namespace.ID(id: self.id)
        }
    }
    
    @inlinable public init() {
        id = 0
    }
    
    package init(id: Int) {
        self.id = id
    }
    
    public static func makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: _GraphInputs) {
        assertUnimplemented()
    }
}

extension Namespace {
    @frozen public struct ID : Hashable {
        package var id: Int
        
        package init(id: Int) {
            self.id = id
        }
    }
}
