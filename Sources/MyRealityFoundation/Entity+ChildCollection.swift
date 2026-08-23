// 0F9EE5CAB151D0B6FBB6A14640A504DF
private import CoreRE
private import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @preconcurrency @MainActor public struct ChildCollection : @MainActor Collection {
        public typealias Element = Entity
        
        public typealias Index = Int
        
        public typealias Indices = DefaultIndices<Entity.ChildCollection>
        
        public typealias Iterator = Entity.ChildCollection.IndexingIterator<Entity.ChildCollection>
        
        public typealias SubSequence = Slice<Entity.ChildCollection>
        
        private(set) var entity: MyRealityFoundation::Entity
        
        @MainActor @preconcurrency public __consuming func makeIterator() -> Entity.ChildCollection.Iterator {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public var startIndex: Int {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor @preconcurrency public var endIndex: Int {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor @preconcurrency public func index(after i: Int) -> Int {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public subscript(index: Int) -> Entity {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @MainActor @preconcurrency public func append(_ child: Entity, preservingWorldTransform: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func append(contentsOf array: [Entity], preservingWorldTransforms: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func append<S>(contentsOf sequence: S, preservingWorldTransforms: Bool = false) where S : Sequence, S.Element : Entity {
            sequence.forEach { child in
                // $s10RealityKit6EntityC15ChildCollectionV6append10contentsOf25preservingWorldTransformsyx_SbtSTRzAC7ElementRczlFyAJXEfU_TA
                self.doAppend(child, preservingWorldTransform: false)
            }
        }
        
        @MainActor @preconcurrency public func append(contentsOf children: Entity.ChildCollection, preservingWorldTransforms: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func remove(_ child: Entity, preservingWorldTransform: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func remove(at index: Int, preservingWorldTransform: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func removeAll(keepCapacity: Bool = false, preservingWorldTransforms: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func removeAll(preservingWorldTransforms: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func replaceAll(_ children: [Entity], preservingWorldTransforms: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func replaceAll<S>(_ children: S, preservingWorldTransforms: Bool = false) where S : Sequence, S.Element : Entity {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity.ChildCollection : @MainActor CustomStringConvertible {
    @MainActor @preconcurrency public var description: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity.ChildCollection {
    public struct IndexingIterator<Elements> where Elements : Collection {
        public init(_elements: Elements) {
            assertUnimplemented()
        }
        
        public init(_elements: Elements, _position: Elements.Index) {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity.ChildCollection.IndexingIterator : IteratorProtocol, Sequence {
    public typealias Element = Elements.Element
    
    public typealias Iterator = Entity.ChildCollection.IndexingIterator<Elements>
    
    public typealias SubSequence = AnySequence<Entity.ChildCollection.IndexingIterator<Elements>.Element>
    
    public mutating func next() -> Elements.Element? {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity.ChildCollection : @MainActor EntityCollection {
    @MainActor @preconcurrency public func append<S>(contentsOf sequence: S) where S : Sequence, S.Element : Entity {
        self.append(contentsOf: sequence, preservingWorldTransforms: false)
    }
    
    @MainActor @preconcurrency public func remove(_ child: Entity) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func insert<S>(contentsOf sequence: S, beforeIndex index: Int) where S : Sequence, S.Element : Entity {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func remove(at index: Int) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func removeAll() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func replaceAll<S>(_ children: S) where S : Sequence, S.Element : Entity {
        assertUnimplemented()
    }
}

extension Entity.ChildCollection {
    fileprivate func doAppend(_: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        assertUnimplemented()
    }
    
    fileprivate func doRemove(_: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        assertUnimplemented()
    }
    
    fileprivate func doSetEntityAt(_: Int, to: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        assertUnimplemented()
    }
}
