@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MeshPartCollection {
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
    
    public init(_ parts: [MeshResource.Part]) {
        assertUnimplemented()
    }
    
    public subscript(id: String) -> MeshResource.Part? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public mutating func insert(_ part: __owned MeshResource.Part) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func update(_ part: __owned MeshResource.Part) -> MeshResource.Part? {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func remove(id: String) -> MeshResource.Part? {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshPartCollection : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> MeshResource.Part? {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias Element = MeshResource.Part
    }
    
    public __consuming func makeIterator() -> MeshPartCollection.Iterator {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Element = MeshResource.Part
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshPartCollection : Collection {
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
    
    public subscript(position: Int) -> MeshResource.Part {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<MeshPartCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<MeshPartCollection>
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshPartCollection : ExpressibleByArrayLiteral {
    public init(arrayLiteral: MeshResource.Part...) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias ArrayLiteralElement = MeshResource.Part
}
