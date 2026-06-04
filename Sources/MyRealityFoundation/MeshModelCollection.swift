@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MeshModelCollection {
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
    
    public init(_ models: [MeshResource.Model]) {
        assertUnimplemented()
    }
    
    public subscript(id: String) -> MeshResource.Model? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public mutating func insert(_ model: __owned MeshResource.Model) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func update(_ model: __owned MeshResource.Model) -> MeshResource.Model? {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func remove(id: String) -> MeshResource.Model? {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshModelCollection : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> MeshResource.Model? {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias Element = MeshResource.Model
    }
    
    public __consuming func makeIterator() -> MeshModelCollection.Iterator {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Element = MeshResource.Model
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshModelCollection : Collection {
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
    
    public subscript(position: Int) -> MeshResource.Model {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<MeshModelCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<MeshModelCollection>
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshModelCollection : ExpressibleByArrayLiteral {
    public init(arrayLiteral: MeshResource.Model...) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias ArrayLiteralElement = MeshResource.Model
}
