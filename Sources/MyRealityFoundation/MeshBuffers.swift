@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum MeshBuffers {
    public struct Identifier : Hashable, Equatable, CustomStringConvertible, Sendable {
        public let name: String
        
        public let isCustom: Bool
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public let isBlendShape: Bool
        
        @safe public static nonisolated(unsafe) let positions: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let normals: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let tangents: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let bitangents: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let textureCoordinates: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let triangleIndices: MeshBuffers.Identifier = {
            assertUnimplemented()
        }()
        
        public var description: String {
            get {
                assertUnimplemented()
            }
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public static func == (lhs: MeshBuffers.Identifier, rhs: MeshBuffers.Identifier) -> Bool {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public enum Rate {
        case vertex
        case face
        case faceVarying
        
        public static func == (a: MeshBuffers.Rate, b: MeshBuffers.Rate) -> Bool {
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
    
    public enum ElementType {
        case uInt8
        case uInt16
        case uInt32
        case int8
        case int16
        case int32
        case float
        case double
        case simd2Float
        case simd3Float
        case simd4Float
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        case jointInfluence
        
        public static func == (a: MeshBuffers.ElementType, b: MeshBuffers.ElementType) -> Bool {
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
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers {
    public struct Semantic<Element> : MeshBufferSemantic {
        public let id: MeshBuffers.Identifier
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias ID = MeshBuffers.Identifier
    }
    
    @safe public static nonisolated(unsafe) let positions: MeshBuffers.Semantic<SIMD3<Float>> = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let normals: MeshBuffers.Semantic<SIMD3<Float>> = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let tangents: MeshBuffers.Semantic<SIMD3<Float>> = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let bitangents: MeshBuffers.Semantic<SIMD3<Float>> = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let textureCoordinates: MeshBuffers.Semantic<SIMD2<Float>> = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let triangleIndices: MeshBuffers.Semantic<UInt32> = {
        assertUnimplemented()
    }()
    
    public static func custom<Value>(_ name: String, type: Value.Type) -> MeshBuffers.Semantic<Value> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshBuffers {
    @safe public static nonisolated(unsafe) let jointInfluences: MeshBuffers.Semantic<MeshJointInfluence> = {
        assertUnimplemented()
    }()
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshBuffers.Identifier {
    @safe public static nonisolated(unsafe) let jointInfluences: MeshBuffers.Identifier = {
        assertUnimplemented()
    }()
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers {
    public typealias Positions = MeshBuffer<SIMD3<Float>>
    
    public typealias Normals = MeshBuffer<SIMD3<Float>>
    
    public typealias Tangents = MeshBuffer<SIMD3<Float>>
    
    public typealias TextureCoordinates = MeshBuffer<SIMD2<Float>>
    
    public typealias TriangleIndices = MeshBuffer<UInt32>
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshBuffers {
    public static func blendShapeOffsets(named: String) -> MeshBuffers.Semantic<SIMD3<Float>> {
        assertUnimplemented()
    }
    
    public typealias BlendShapeOffsets = MeshBuffer<SIMD3<Float>>
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshBuffers {
    public typealias JointInfluences = MeshBuffer<MeshJointInfluence>
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers.Rate : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers.Rate : Hashable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers.ElementType : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffers.ElementType : Hashable {}
