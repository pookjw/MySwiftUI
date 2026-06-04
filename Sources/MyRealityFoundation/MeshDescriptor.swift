@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MeshDescriptor : MeshBufferContainer {
    public enum Materials {
        case allFaces(UInt32)
        case perFace([UInt32])
    }
    
    public enum Primitives {
        case triangles([UInt32])
        case polygons([UInt8], [UInt32])
        case trianglesAndQuads(triangles: [UInt32], quads: [UInt32])
    }
    
    public init(name: String = "") {
        assertUnimplemented()
    }
    
    public var name: String
    
    public var materials: MeshDescriptor.Materials
    
    public var primitives: MeshDescriptor.Primitives?
    
    public var buffers: [MeshBuffers.Identifier : AnyMeshBuffer] {
        get {
            assertUnimplemented()
        }
    }
    
    public subscript<S>(semantic: S) -> MeshBuffer<S.Element>? where S : MeshBufferSemantic {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
