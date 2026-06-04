public import AudioToolbox
public import CoreMedia
public import simd
public import Spatial
public import Combine
public import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class Scene {
    @MainActor @preconcurrency public var __coreScene: __SceneRef {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var name: String {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __audioListener: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    @MainActor @preconcurrency public func __addPostProcessingAudioEffect(_ auDesc: AudioComponentDescription) -> AUAudioUnit? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __defaultCamera: Entity! {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    @MainActor @preconcurrency public var anchors: Scene.AnchorCollection {
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
    
    @available(visionOS, unavailable)
    @MainActor @preconcurrency public func addAnchor(_ anchor: any HasAnchoring) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    @MainActor @preconcurrency public func removeAnchor(_ anchor: any HasAnchoring) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __testInit(name: String) -> Scene {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func findEntity(named name: String) -> Entity? {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public func findEntity(id: Entity.ID) -> Entity? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __interactionService: any __RKEntityInteractionService {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var synchronizationService: (any SynchronizationService)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var __sceneIdentifier: UUID? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var __anchoringType: __REAnchoringType? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension Scene {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func performQuery(_ query: EntityQuery) -> QueryResult<Entity> {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)? = nil, _ handler: @escaping (E) -> Void) -> any Cancellable where E : Event {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func publisher<E>(for event: E.Type, on sourceObject: (any EventSource)? = nil) -> Scene.Publisher<E> where E : Event {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @preconcurrency @MainActor public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)? = nil, componentType: (any Component.Type)?, _ handler: @escaping (E) -> Void) -> any Cancellable where E : Event {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func publisher<E>(for event: E.Type, on sourceObject: (any EventSource)? = nil, componentType: (any Component.Type)?) -> Scene.Publisher<E> where E : Event {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    public struct Publisher<E> : Combine.Publisher where E : Event {
        public typealias Output = E
        public typealias Failure = Never
        
        public func receive<S>(subscriber: S) where E == S.Input, S : Subscriber, S.Failure == Never {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @preconcurrency @MainActor public struct AnchorCollection : @MainActor Collection {
        public typealias Element = HasAnchoring
        public typealias Index = Int
        public typealias Indices = DefaultIndices<Scene.AnchorCollection>
        public typealias Iterator = Entity.ChildCollection.IndexingIterator<Scene.AnchorCollection>
        public typealias SubSequence = Slice<Scene.AnchorCollection>
        
        @MainActor @preconcurrency public __consuming func makeIterator() -> Scene.AnchorCollection.Iterator {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public var startIndex: Int {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public var endIndex: Int {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func index(after i: Int) -> Int {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public subscript(index: Int) -> any HasAnchoring {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @MainActor @preconcurrency public func append(_ entity: any HasAnchoring) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func append(contentsOf array: [any HasAnchoring]) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func append<S>(contentsOf sequence: S) where S : Sequence, S.Element : HasAnchoring {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func remove(_ entity: any HasAnchoring) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func remove(at index: Int) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func removeAll(keepCapacity: Bool = false) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func removeAll() {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func replaceAll(_ entities: [any HasAnchoring]) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public func replaceAll<S>(_ entities: S) where S : Sequence, S.Element : HasAnchoring {
            assertUnimplemented()
        }
        
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene.AnchorCollection : @MainActor CustomStringConvertible {
    @MainActor @preconcurrency public var description: String {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public static func __fromCore(_ coreScene: __SceneRef) -> Scene {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : Hashable {
    nonisolated public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    nonisolated public static func == (lhs: Scene, rhs: Scene) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : Identifiable {
    nonisolated public var id: UInt64 {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : EventSource {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var __corePointer: OpaquePointer {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var __gravity: SIMD3<Float>? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __adaptiveTimeStep: Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var timebase: CMTimebase {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public func raycast(origin: SIMD3<Float>, direction: SIMD3<Float>, length: Float = 100, query: CollisionCastQueryType = .all, mask: CollisionGroup = .all, relativeTo referenceEntity: Entity? = nil) -> [CollisionCastHit] {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func raycast(from startPosition: SIMD3<Float>, to endPosition: SIMD3<Float>, query: CollisionCastQueryType = .all, mask: CollisionGroup = .all, relativeTo referenceEntity: Entity? = nil) -> [CollisionCastHit] {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convexCast(convexShape: ShapeResource, fromPosition: SIMD3<Float>, fromOrientation: simd_quatf, toPosition: SIMD3<Float>, toOrientation: simd_quatf, query: CollisionCastQueryType = .all, mask: CollisionGroup = .all, relativeTo referenceEntity: Entity? = nil) -> [CollisionCastHit] {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Scene : @MainActor CoordinateSpace3DFloat {
    @available(macOS, unavailable, introduced: 26.0)
    @MainActor @preconcurrency public func ancestorFromSpaceTransformFloat() throws -> ProjectiveTransform3DFloat {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable, introduced: 26.0)
    @MainActor @preconcurrency public var ancestorSpace: (some CoordinateSpace3DFloat)? {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable, introduced: 26.0)
    @MainActor @preconcurrency public func transform(from targetCoordinateSpace: Scene) throws -> ProjectiveTransform3D {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension Scene {
    @MainActor @preconcurrency public func pixelCast(origin: SIMD3<Float>, direction: SIMD3<Float>, length: Float = 100) async throws -> PixelCastHit? {
        ssertUnimplemented()
    }
    
    @MainActor @preconcurrency public func pixelCast(from startPosition: SIMD3<Float>, to endPosition: SIMD3<Float>) async throws -> PixelCastHit? {
        ssertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : Sendable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene.AnchorCollection : Sendable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __SceneRef {
    public func __as<T>(_ type: T.Type) -> T {
        assertUnimplemented()
    }
    
    public static func __fromCore(_ core: Any) -> __SceneRef {
        assertUnimplemented()
    }
}
