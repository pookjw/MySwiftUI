@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct AnyMeshBuffer {
    public var id: MeshBuffers.Identifier {
        get {
            assertUnimplemented()
        }
    }
    
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public var rate: MeshBuffers.Rate {
        get {
            assertUnimplemented()
        }
    }
    
    public var elementType: MeshBuffers.ElementType {
        get {
            assertUnimplemented()
        }
    }
    
    public func get<Value>(_: Value.Type = Value.self) -> MeshBuffer<Value>? {
        assertUnimplemented()
    }
}
