// 0F9EE5CAB151D0B6FBB6A14640A504DF
private import CoreRE
private import simd
private import RealityFusion

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
    fileprivate func doAppend(_ child: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        if preservingWorldTransform {
            // <+36>
            let rotation = simd_quatf.identity
            // sp + 0x10
            let matrix_1 = MyRealityFoundation::Entity.conversionMatrix(from: child, to: self.entity)
            let matrix_2 = simd_float4x4(
                translation: .zero,
                rotation: rotation,
                scale: SIMD3<Float>(1, 1, 1)
            )
            
            var v0 = matrix_2.columns.0
            let v1 = matrix_2.columns.1
            let v2 = matrix_2.columns.2
            let v3 = matrix_2.columns.3
            
            let v18 = matrix_1.columns.0
            let v17 = matrix_1.columns.1
            
            var v4 = v18 * v0.x
            v4 = v4 + v17 * v0.y
            
            let v16 = matrix_1.columns.2
            var v7 = matrix_1.columns.3
            
            v4 = v4 + v16 * v0.z
            v4 = v4 + v7 * v0.w
            
            var v5 = v18 * v1.x
            v5 = v5 + v17 * v1.y
            v5 = v5 + v16 * v1.z
            v5 = v5 + v7 * v1.w
            
            var v6 = v18 * v2.x
            v6 = v6 + v17 * v2.y
            v6 = v6 + v16 * v2.z
            v6 = v6 + v7 * v2.w
            
            v0 = v7
            
            v7 = v18 * v3.x
            v7 = v7 + v17 * v3.y
            v7 = v7 + v16 * v3.z
            v7 = v7 + v0 * v3.w
            
            // x29 - 0x70
            let srt = CoreRE::SRT(matrix: simd_float4x4(v0, v1, v2, v3))
            
            // <+212>
            let component = Transform(
                scale: srt.s,
                rotation: srt.r,
                translation: srt.t
            )
            
            child.components.set(component)
        }
        
        // <+264>
        unsafe unsafeBitCast(child.coreEntity, to: CoreRE::Entity.self)
            .parent = unsafeBitCast(self.entity.coreEntity, to: CoreRE::Entity.self)
        
        if let casted = child as? HasAnchoring {
            let flag: Bool // true -> <+608> / false -> <+752>
            if let session = unsafe RealityFusionSession.sharedSession {
                if let serviceManager = session.serviceManager {
                    // <+360>
                    if
                        let anchorManagementService = serviceManager.anchorManagementService,
                        let scene = self.entity.scene
                    {
                        unsafe anchorManagementService.updateAnchoringInScene(
                            unsafeBitCast(scene.coreScene, to: CoreRE::Scene.self)
                        )
                    }
                    
                    // <+544>
                } else {
                    // <+476>
                    // <+544>
                }
                
                if
                    let session = unsafe RealityFusionSession.sharedSession,
                    let serviceManager = session.serviceManager,
                    serviceManager.anchorManagementService != nil
                {
                    // <+752>
                    flag = false
                } else {
                    // <+608>
                    flag = true
                }
            } else {
                // <+464>
                // <+608>
                flag = true
            }
            
            // <+608>
            if flag {
                if let scene = self.entity.scene {
                    scene.updateNewAnchoring(child, frame: nil, allowAnchoringIfRemote: false)
                }
            }
        }
        
        // <+752>
        Entity.updateInteractions(root: child)
        child.updateSceneGravityIfNeeded()
    }
    
    fileprivate func doRemove(_: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        assertUnimplemented()
    }
    
    fileprivate func doSetEntityAt(_: Int, to: MyRealityFoundation::Entity, preservingWorldTransform: Bool) {
        assertUnimplemented()
    }
}
