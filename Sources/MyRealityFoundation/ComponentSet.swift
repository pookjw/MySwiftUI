// DEDB7026E54141B3B16F1E48333B73DE
private import CoreRE
private import Observation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @preconcurrency @MainActor public struct ComponentSet {
        @MainActor @preconcurrency public subscript<T>(componentType: T.Type) -> T? where T : Component {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }

        @_disfavoredOverload @MainActor @preconcurrency public subscript(componentType: any Component.Type) -> (any Component)? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }
        
        subscript<T : Component>(metaType: HashableMetatype<T>) -> T? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }

        @MainActor @preconcurrency public func set<T>(_ component: T) where T : Component {
            self.doSet(T.self, newValue: component, returnStrongReference: false)
        }

        @MainActor @preconcurrency public func set(_ components: [any Component]) {
            assertUnimplemented()
        }

        @MainActor @preconcurrency public func has(_ componentType: any Component.Type) -> Bool {
            assertUnimplemented()
        }

        @MainActor @preconcurrency public func remove(_ componentType: any Component.Type) {
            assertUnimplemented()
        }

        @MainActor @preconcurrency public func removeAll() {
            assertUnimplemented()
        }

        @MainActor @preconcurrency public var count: Int {
            get {
                assertUnimplemented()
            }
        }

        var entity: Entity

        func doSet<T : Component>(_ type: T.Type, newValue: T?, returnStrongReference: Bool) {
            /*
             self -> x20
             type -> x0 -> x22
             newValue -> x1 -> x29 - 0x68
             returnStrongReference -> w2 -> x29 - 0x88
             */
            // <+220>
            // x29 - 0x70
            let entity = self.entity
            // x29 - 0x80
            let coreEntity = unsafe unsafeBitCast(entity.coreEntity, to: CoreRE::Entity.self)
            
            let coreType = T.__coreComponentType
            
            if coreType.core == .custom {
                // <+268>
                // x26
                let componentType = unsafe unsafeBitCast(
                    SceneManager.customComponentType(type),
                    to: CoreRE::Component.ClassPtr.self
                )
                
                // x25
                let component = coreEntity.getComponent(ofType: componentType)
                // x24
                let copy_1 = newValue
                
                if let copy_2 = copy_1 {
                    // <+632>
                    // copy_2 -> x27 (x29 - 0x78)
                    if
                        let _component = component ?? coreEntity.addComponentNoEvents(ofType: componentType),
                        let customObject = unsafe _component.customComponentObject
                    {
                        // <+696>
                        // _component -> x22
                        let hasValue = (component == nil)
                        
                        entity.withMutation(componentType: type) { 
                            // $s10RealityKit6EntityC12ComponentSetV02doE0_8newValue21returnStrongReferenceyxm_xSgSbtAA0D0RzlFyyXEfU1_TA
                            unsafe T.__store(
                                attribute: copy_2,
                                to: customObject,
                                offset: 0,
                                deinitialize: !hasValue
                            )
                        }
                        
                        if component == nil {
                            coreEntity.sendAddAndActivateComponentEvents(ofType: componentType)
                        }
                        
                        _component.networkMarkComponentDirty()
                        // <+832>
                    } else {
                        // <+832>
                    }
                    
                    // <+832>
                    // <+1032>
                } else {
                    // <+356>
                    if component != nil {
                        entity.withMutation(componentType: type) { 
                            // $s10RealityKit6EntityC12ComponentSetV02doE11Existential33_DEDB7026E54141B3B16F1E48333B73DELL_8newValueyAA0D0_pXp_AaI_pSgtFyyXEfU0_TA
                            coreEntity.removeComponent(ofType: componentType)
                        }
                        
                        // <+1044>
                    } else {
                        // <+1044>
                    }
                }
            } else {
                // <+444>
                // coreEntity -> x20
                if let componentClass = CoreRE::Component.ClassPtr.fromType(coreType.core) {
                    // componentClass -> x25
                    // x26
                    let copy_1 = newValue
                    
                    if let copy_2 = copy_1 {
                        // <+840>
                        // copy_2 -> x27 (x29 - 0x80)
                        let component = coreEntity.getComponent(ofType: componentClass)
                        
                        if let _component = component ?? coreEntity.addComponentNoEvents(ofType: componentClass) {
                            entity.withMutation(componentType: type) { 
                                // $s10RealityKit6EntityC12ComponentSetV02doE0_8newValue21returnStrongReferenceyxm_xSgSbtAA0D0RzlFyyXEfU_TA
                                if T.self == ModelComponent.self {
                                    // <+132>
                                    let modelComponent = copy_2 as! ModelComponent
                                    unsafe modelComponent.__toCore(
                                        __ComponentRef(
                                            core: unsafeBitCast(_component, to: OpaquePointer.self)
                                        ),
                                        returnStrongReference: returnStrongReference
                                    )
                                } else {
                                    // <+100>
                                    unsafe copy_2.__toCore(
                                        __ComponentRef(
                                            core: unsafeBitCast(_component, to: OpaquePointer.self)
                                        )
                                    )
                                }
                            }
                            
                            if component == nil {
                                coreEntity.sendAddAndActivateComponentEvents(ofType: componentClass)
                            }
                        } else {
                            // <+1024>
                        }
                    } else {
                        // <+524>
                        entity.withMutation(componentType: type) { 
                            // $s10RealityKit6EntityC12ComponentSetV02doE0_8newValue21returnStrongReferenceyxm_xSgSbtAA0D0RzlFyyXEfU0_TA
                            coreEntity.removeComponent(ofType: componentClass)
                        }
                        // <+1044>
                    }
                } else {
                    // <+1044>
                }
            }
        }
        
        func doGet<T : Component>(_: T.Type, borrowStrongReference: Bool) -> T? {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity.ComponentSet : @MainActor Sequence {
    @MainActor @preconcurrency public __consuming func makeIterator() -> Entity.ComponentSet.Iterator {
        assertUnimplemented()
    }

    public struct Iterator : IteratorProtocol {
        public mutating func next() -> (any Component)? {
            assertUnimplemented()
        }

        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = any Component
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity.ComponentSet : @MainActor Collection {
    public typealias Element = any Component

    public struct Index : Comparable, Sendable {
        public static func < (lhs: Entity.ComponentSet.Index, rhs: Entity.ComponentSet.Index) -> Bool {
            assertUnimplemented()
        }

        public static func == (a: Entity.ComponentSet.Index, b: Entity.ComponentSet.Index) -> Bool {
            assertUnimplemented()
        }
    }

    @MainActor @preconcurrency public var startIndex: Entity.ComponentSet.Index {
        get {
            assertUnimplemented()
        }
    }

    @MainActor @preconcurrency public var endIndex: Entity.ComponentSet.Index {
        get {
            assertUnimplemented()
        }
    }

    @MainActor @preconcurrency public var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
    }

    @MainActor @preconcurrency public func index(after index: Entity.ComponentSet.Index) -> Entity.ComponentSet.Index {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func formIndex(after i: inout Entity.ComponentSet.Index) {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public func distance(from start: Entity.ComponentSet.Index, to end: Entity.ComponentSet.Index) -> Int {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public subscript(position: Entity.ComponentSet.Index) -> any Component {
        get {
            assertUnimplemented()
        }
    }

    public struct Indices : Collection, Sendable {
        public typealias Index = Entity.ComponentSet.Index

        public typealias Element = Entity.ComponentSet.Index

        public typealias Indices = Entity.ComponentSet.Indices

        public typealias SubSequence = Entity.ComponentSet.Indices

        public var startIndex: Entity.ComponentSet.Indices.Index {
            get {
                assertUnimplemented()
            }
        }

        public var endIndex: Entity.ComponentSet.Indices.Index {
            get {
                assertUnimplemented()
            }
        }

        public func index(after i: Entity.ComponentSet.Indices.Index) -> Entity.ComponentSet.Indices.Index {
            assertUnimplemented()
        }

        public func formIndex(after i: inout Entity.ComponentSet.Indices.Index) {
            assertUnimplemented()
        }

        @inlinable public subscript(position: Entity.ComponentSet.Indices.Index) -> Entity.ComponentSet.Indices.Index {
            get { position }
        }

        public func distance(from start: Entity.ComponentSet.Indices.Index, to end: Entity.ComponentSet.Indices.Index) -> Int {
            assertUnimplemented()
        }

        public subscript(bounds: Range<Entity.ComponentSet.Indices.Index>) -> Entity.ComponentSet.Indices {
            get {
                assertUnimplemented()
            }
        }

        @inlinable public var indices: Entity.ComponentSet.Indices {
            get { self }
        }

        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Iterator = IndexingIterator<Entity.ComponentSet.Indices>
    }

    @MainActor @preconcurrency public var indices: Entity.ComponentSet.Indices {
        get {
            assertUnimplemented()
        }
    }

    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<Entity.ComponentSet>
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
extension Entity.ComponentSet.Indices : BidirectionalCollection {
    public func index(before i: Entity.ComponentSet.Indices.Index) -> Entity.ComponentSet.Indices.Index {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
extension Entity.ComponentSet : @MainActor BidirectionalCollection {
    @MainActor @preconcurrency public func index(before index: Entity.ComponentSet.Index) -> Entity.ComponentSet.Index {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension Entity.ComponentSet {
    @MainActor @preconcurrency public func set<T>(_ component: T) where T : _ImplicitlyAnimatableBuiltinComponent {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public subscript<T>(componentType: T.Type) -> T? where T : _ImplicitlyAnimatableBuiltinComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity.ComponentSet : Sendable {}

extension Entity {
    func withMutation<T, U>(keyPath: KeyPath<MyRealityFoundation::Entity, T>, _ block: () throws -> U) rethrows -> U? {
        assertUnimplemented()
    }
    
    func withMutation<T : MyRealityFoundation::Component, U>(componentType: T.Type, _ block: () throws -> U) rethrows -> U? {
        /*
         self -> x20
         componentType -> x0 -> x29 - 0xb0
         block -> x1/x2 -> x29 - 0x80 / x29 - 0x88
         */
        // x22
        let observationRegistrar: ObservationRegistrar?
        if let ptr = unsafe unsafeBitCast(
            self.coreEntity,
            to: CoreRE::Entity.self
        ).observationRegistrar {
            observationRegistrar = unsafe ptr
                .assumingMemoryBound(to: ObservationRegistrar?.self)
                .pointee
        } else {
            observationRegistrar = nil
        }
        
        // <+352>
        if observationRegistrar != nil {
            // <+528>
            return try self.withMutation(
                keyPath: \MyRealityFoundation::Entity.components[HashableMetatype<T>(componentType)],
                block
            )
        } else {
            // <+428>
            // <+500>
            // <+904>
            return try block()
        }
    }
}
