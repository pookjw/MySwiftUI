internal import MyRealityFoundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
public struct RealityViewEntityCollection : MyRealityFoundation::EntityCollection {
    let entity: MyRealityFoundation::Entity
    
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
    
    public subscript(index: Int) -> MyRealityFoundation::Entity {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(after i: Int) -> Int {
        assertUnimplemented()
    }
    
    public mutating func insert<S>(contentsOf sequence: S, beforeIndex index: Int) where S : Sequence, S.Element : MyRealityFoundation::Entity {
        assertUnimplemented()
    }
    
    public mutating func append<S>(contentsOf sequence: S) where S : Sequence & Sendable, S.Element : MyRealityFoundation::Entity {
        self.entity.children.append(contentsOf: sequence)
    }
    
    public mutating func remove(_ child: MyRealityFoundation::Entity) {
        assertUnimplemented()
    }
    
    public mutating func remove(at index: Int) {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
    
    public mutating func replaceAll<S>(_ children: S) where S : Sequence, S.Element : MyRealityFoundation::Entity {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    public typealias Element = MyRealityFoundation::Entity
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    public typealias Indices = DefaultIndices<RealityViewEntityCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    public typealias Iterator = IndexingIterator<RealityViewEntityCollection>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    public typealias SubSequence = Slice<RealityViewEntityCollection>
}
