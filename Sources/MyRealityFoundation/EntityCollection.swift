@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public protocol EntityCollection : Collection where Self.Element == Entity, Self.Index == Int {
    mutating func append(_ entity: Entity)
    
    mutating func append<S>(contentsOf sequence: S) where S : Sequence, S.Element : Entity
    
    mutating func insert(_ entity: Entity, beforeIndex index: Int)
    
    mutating func insert<S>(contentsOf sequence: S, beforeIndex index: Int) where S : Sequence, S.Element : Entity
    
    mutating func remove(_ entity: Entity)
    
    mutating func remove(at index: Int)
    
    mutating func removeAll()
    
    mutating func removeAll(where: (Entity) throws -> Bool) rethrows
    
    mutating func replaceAll<S>(_ entities: S) where S : Sequence, S.Element : Entity
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension EntityCollection {
    public mutating func append(_ entity: Entity) {
        assertUnimplemented()
    }
    
    public mutating func append<S>(contentsOf sequence: S) where S : Sequence, S.Element : Entity {
        assertUnimplemented()
    }
    
    public mutating func insert(_ entity: Entity, beforeIndex index: Int) {
        assertUnimplemented()
    }
    
    public mutating func remove(_ entity: Entity) {
        assertUnimplemented()
    }
    
    public mutating func removeAll() {
        assertUnimplemented()
    }
    
    public mutating func removeAll(where shouldBeRemoved: (Entity) throws -> Bool) rethrows {
        assertUnimplemented()
    }
    
    public mutating func replaceAll<S>(_ entities: S) where S : Sequence, S.Element : Entity {
        assertUnimplemented()
    }
}
