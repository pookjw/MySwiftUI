public import Metal

@_hasMissingDesignatedInitializers @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@MainActor public class LowLevelMesh {
    public enum VertexSemantic : Sendable {
        case position
        case color
        case normal
        case tangent
        case bitangent
        case uv0
        case uv1
        case uv2
        case uv3
        case uv4
        case uv5
        case uv6
        case uv7
        case unspecified
        
        public static func == (a: LowLevelMesh.VertexSemantic, b: LowLevelMesh.VertexSemantic) -> Bool {
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
    
    public struct Attribute : Sendable {
        public init(semantic: LowLevelMesh.VertexSemantic, format: MTLVertexFormat, layoutIndex: Int = 0, offset: Int) {
            assertUnimplemented()
        }
        
        public var semantic: LowLevelMesh.VertexSemantic
        
        public var format: MTLVertexFormat
        
        public var offset: Int
        
        public var layoutIndex: Int
    }
    
    public struct Layout : Sendable {
        public init(bufferIndex: Int, bufferOffset: Int = 0, bufferStride: Int) {
            assertUnimplemented()
        }
        
        public var bufferIndex: Int
        
        public var bufferOffset: Int
        
        public var bufferStride: Int
    }
    
    public struct Descriptor : Sendable {
        public init(vertexCapacity: Int = 0, vertexAttributes: [LowLevelMesh.Attribute] = [Attribute](), vertexLayouts: [LowLevelMesh.Layout] = [Layout](), indexCapacity: Int = 0, indexType: MTLIndexType = MTLIndexType.uint32) {
            assertUnimplemented()
        }
        
        @safe public static nonisolated(unsafe) let maxVertexBufferCount: Int = {
            assertUnimplemented()
        }()
        
        public var vertexBufferCount: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var vertexCapacity: Int
        
        public var vertexAttributes: [LowLevelMesh.Attribute]
        
        public var vertexLayouts: [LowLevelMesh.Layout] {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var indexCapacity: Int
        
        public var indexType: MTLIndexType
    }
    
    public struct Part : Sendable {
        public init(indexOffset: Int = 0, indexCount: Int = 0, topology: MTLPrimitiveType = .triangle, materialIndex: Int = 0, bounds: BoundingBox) {
            assertUnimplemented()
        }
        
        public var indexOffset: Int
        
        public var indexCount: Int
        
        public var topology: MTLPrimitiveType
        
        public var materialIndex: Int
        
        public var bounds: BoundingBox
    }
    
    @MainActor final public let descriptor: LowLevelMesh.Descriptor = {
        assertUnimplemented()
    }()
    
    @MainActor public var indexCapacity: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var vertexCapacity: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public struct PartsCollection {
    }
    
    @MainActor public var parts: LowLevelMesh.PartsCollection {
        _read {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor public init(descriptor: LowLevelMesh.Descriptor) throws {
        assertUnimplemented()
    }
    
    @MainActor public func read(bufferIndex index: Int, using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    @MainActor public func replace(bufferIndex index: Int, using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    @MainActor public func readIndices(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    @MainActor public func replaceIndices(using commandBuffer: any MTLCommandBuffer) -> any MTLBuffer {
        assertUnimplemented()
    }
    
    @MainActor public func withUnsafeBytes(bufferIndex: Int, _ callback: (UnsafeRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor public func withUnsafeMutableBytes(bufferIndex: Int, _ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor public func replaceUnsafeMutableBytes(bufferIndex: Int, _ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor public func withUnsafeIndices(_ callback: (UnsafeRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor public func withUnsafeMutableIndices(_ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor public func replaceUnsafeMutableIndices(_ callback: (UnsafeMutableRawBufferPointer) -> Void) {
        assertUnimplemented()
    }
    }

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelMesh.PartsCollection : MutableCollection, RandomAccessCollection {
    public typealias Element = LowLevelMesh.Part
    
    public typealias Index = Int
    
    public var startIndex: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public var endIndex: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(after i: Int) -> Int {
        assertUnimplemented()
    }
    
    public subscript(position: LowLevelMesh.PartsCollection.Index) -> LowLevelMesh.Part {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = Range<LowLevelMesh.PartsCollection.Index>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Iterator = IndexingIterator<LowLevelMesh.PartsCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<LowLevelMesh.PartsCollection>
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelMesh.PartsCollection {
    public mutating func append(_ newElement: LowLevelMesh.PartsCollection.Element) {
        assertUnimplemented()
    }
    
    public mutating func append<S>(contentsOf newElements: S) where S : Sequence, S.Element == LowLevelMesh.Part {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
    
    public mutating func replaceAll<S>(_ newElements: S) where S : Sequence, S.Element == LowLevelMesh.Part {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelMesh.VertexSemantic : Equatable {}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelMesh.VertexSemantic : Hashable {}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelMesh : Sendable {}
