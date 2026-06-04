@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol MeshBufferContainer {
    var buffers: [MeshBuffers.Identifier : AnyMeshBuffer] { get }
    subscript<S>(semantic: S) -> MeshBuffer<S.Element>? where S : MeshBufferSemantic { get set }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBufferContainer {
    public var positions: MeshBuffers.Positions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var normals: MeshBuffers.Normals? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var tangents: MeshBuffers.Tangents? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var bitangents: MeshBuffers.Tangents? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var textureCoordinates: MeshBuffers.TextureCoordinates? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshBufferContainer {
    public func blendShapeOffsets(named: String) -> MeshBuffers.BlendShapeOffsets? {
        assertUnimplemented()
    }
    
    public mutating func setBlendShapeOffsets(named: String, buffer: MeshBuffers.BlendShapeOffsets?) {
        assertUnimplemented()
    }
    
    public var blendShapeNames: [String] {
        get {
            assertUnimplemented()
        }
    }
}
