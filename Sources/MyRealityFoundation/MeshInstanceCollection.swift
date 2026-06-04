@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MeshInstanceCollection {
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(_ instances: [MeshResource.Instance]) {
        assertUnimplemented()
    }
    
    public subscript(id: String) -> MeshResource.Instance? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public mutating func insert(_ instance: __owned MeshResource.Instance) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func update(_ instance: __owned MeshResource.Instance) -> MeshResource.Instance? {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func remove(id: String) -> MeshResource.Instance? {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshInstanceCollection : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> MeshResource.Instance? {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias Element = MeshResource.Instance
    }
    
    public __consuming func makeIterator() -> MeshInstanceCollection.Iterator {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Element = MeshResource.Instance
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshInstanceCollection : Collection {
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
    
    public func index(after i: Int) -> Int {
        assertUnimplemented()
    }
    
    public func formIndex(after i: inout Int) {
        assertUnimplemented()
    }
    
    public subscript(position: Int) -> MeshResource.Instance {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<MeshInstanceCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<MeshInstanceCollection>
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshInstanceCollection : ExpressibleByArrayLiteral {
    public init(arrayLiteral: MeshResource.Instance...) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias ArrayLiteralElement = MeshResource.Instance
}
