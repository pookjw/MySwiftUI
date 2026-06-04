@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
final public class __MeshCompileOptions {
    final public var coreOptions: OpaquePointer {
        get {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    final public var generateVertexFaceAdjacencyAttributes: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var reorderVertexCaching: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var repairTangents: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var mergeVerticesIfPolygonSoup: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var preserveSharpFeatures: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var preserveSubdivisonSurfaceData: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final public var generateDecimatedMesh: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension __MeshCompileOptions {
    public enum AttributeCompressionType {
        case float16
        case uNorm8
        case sNorm8
        
        public static func == (a: __MeshCompileOptions.AttributeCompressionType, b: __MeshCompileOptions.AttributeCompressionType) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    final public subscript(attribute: String) -> (type: __MeshCompileOptions.AttributeCompressionType, tolerance: Float)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension __MeshCompileOptions.AttributeCompressionType : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension __MeshCompileOptions.AttributeCompressionType : Hashable {}
