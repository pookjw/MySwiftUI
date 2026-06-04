@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct MeshSkeletonCollection {
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
    
    public init(_ skeletons: [MeshResource.Skeleton]) {
        assertUnimplemented()
    }
    
    public subscript(id: String) -> MeshResource.Skeleton? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public mutating func insert(_ instance: __owned MeshResource.Skeleton) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func update(_ instance: __owned MeshResource.Skeleton) -> MeshResource.Skeleton? {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func remove(id: String) -> MeshResource.Skeleton? {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshSkeletonCollection : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> MeshResource.Skeleton? {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = MeshResource.Skeleton
    }
    
    public __consuming func makeIterator() -> MeshSkeletonCollection.Iterator {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Element = MeshResource.Skeleton
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MeshSkeletonCollection : Collection {
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
    
    public subscript(position: Int) -> MeshResource.Skeleton {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<MeshSkeletonCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<MeshSkeletonCollection>
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshSkeletonCollection : ExpressibleByArrayLiteral {
    public init(arrayLiteral: MeshResource.Skeleton...) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ArrayLiteralElement = MeshResource.Skeleton
}
