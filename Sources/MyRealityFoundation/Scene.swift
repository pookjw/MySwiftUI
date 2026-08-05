// DA45B996DED25E91FC52ACD404A5FDFE
public import Combine
public import Foundation
public import AudioToolbox
public import Spatial
public import CoreMedia
private import CoreRE

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
    @preconcurrency @MainActor public func subscribe<E>(
        to event: E.Type,
        on sourceObject: (any EventSource)? = nil,
        componentType: (any Component.Type)?,
        _ handler: @escaping (E) -> Void
    ) -> any Cancellable where E : Event {
        return self.subscribe(
            to: event,
            on: sourceObject,
            componentType: componentType,
            rootEntity: nil,
            matching: nil,
            handler
        )
    }
    
    func subscribe<E : Event>(
        to event: E.Type,
        on sourceObject: (any EventSource)?,
        componentType: (any Component.Type)?,
        rootEntity: MyRealityFoundation::Entity?,
        matching: String?,
        _ handler: @escaping (E) -> Void
    ) -> any Cancellable {
        if event == SynchronizationEvents.OwnershipRequest.self {
            // <+300>
            return unsafe self.eventService
                .publisher(for: CoreRE::REOwnershipRequestEvent.self, on: sourceObject)
                .sink { [weak self] event in
                    // $s10RealityKit5SceneC0A10FoundationE9subscribe2to2on13componentType10rootEntity8matching_7Combine11Cancellable_pxm_AA11EventSource_pSgAA9Component_pXpSgAA0K0CSgSSSgyxctAA0O0RzlFySo018REOwnershipRequestO0VcfU_TA
                    guard
                        let self,
                        let synchronizationService
                    else {
                        return
                    }
                    
                    // <+172>
                    guard let peerID = unsafe synchronizationService.__fromCore(
                        peerID: __PeerIDRef(core: event.identifier)
                    ) else {
                        return
                    }
                    
                    // <+256>
                    var flag = false
                    
                    let ownership = unsafe SynchronizationEvents.OwnershipRequest(
                        entity: MyRealityFoundation::Entity.__fromCore(
                            __EntityRef(
                                core: unsafeBitCast(event.entity!, to: OpaquePointer.self)
                            )
                        ),
                        requester: peerID,
                        accept: {
                            // $s10RealityKit5SceneC0A10FoundationE9subscribe2to2on13componentType10rootEntity8matching_7Combine11Cancellable_pxm_AA11EventSource_pSgAA9Component_pXpSgAA0K0CSgSSSgyxctAA0O0RzlFySo018REOwnershipRequestO0VcfU_yycfU_TA
                            flag = true
                        }
                    )
                    
                    let casted = handler as! ((SynchronizationEvents.OwnershipRequest) -> Void)
                    casted(ownership)
                    
                    unsafe event.unknown0!.pointee = flag
                }
        } else if (event != SceneEvents.Update.self) && (event != SceneEvents.Render.self) {
            // <+564>
            return self.publisher(
                for: event,
                on: sourceObject,
                componentType: componentType,
                rootEntity: rootEntity,
                matching: matching
            )
            .sink { [weak self] event in
                // $s10RealityKit5SceneC0A10FoundationE9subscribe2to2on13componentType10rootEntity8matching_7Combine11Cancellable_pxm_AA11EventSource_pSgAA9Component_pXpSgAA0K0CSgSSSgyxctAA0O0RzlFyxcfU0_TA
                guard let self else {
                    return
                }
                
                let scene = unsafe unsafeBitCast(self.coreScene, to: CoreRE::Scene.self)
                
                guard scene.isFromActiveRealityRendererSceneGroup else {
                    return
                }
                
                handler(event)
            }
        } else {
            // <+92>
            return self.publisher(
                for: event,
                on: sourceObject,
                componentType: componentType,
                rootEntity: rootEntity,
                matching: matching
            )
            .sink { event in
                // $s10RealityKit5SceneC0A10FoundationE9subscribe2to2on13componentType10rootEntity8matching_7Combine11Cancellable_pxm_AA11EventSource_pSgAA9Component_pXpSgAA0K0CSgSSSgyxctAA0O0RzlFyxcfU1_TA
                handler(event)
            }
        }
    }
    
    @preconcurrency @MainActor public func publisher<E>(
        for event: E.Type,
        on sourceObject: (any EventSource)? = nil,
        componentType: (any Component.Type)?
    ) -> Scene.Publisher<E> where E : Event {
        assertUnimplemented()
    }
    
    func publisher<T : Event>(
        for type: T.Type,
        on eventSource: EventSource?,
        componentType: any MyRealityFoundation::Component.Type?,
        rootEntity: MyRealityFoundation::Entity?,
        matching: String?
    ) -> MyRealityFoundation::Scene.Publisher<T> {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    public struct Publisher<E> : Combine::Publisher where E : Event {
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
        get {
            assertUnimplemented()
        }
    }
}

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@safe @preconcurrency @MainActor public class Scene {
    private let coreScene: OpaquePointer // 0x10
    private var realityAssetCollisionSubscription: (any Cancellable)? = nil // 0x18
    private var session = WeakSessionAR()
    @MainActor @preconcurrency public var __audioListener: Entity? = nil // 0x40
    private var internalAudioListener: Entity? = nil // 0x48
    private var defaultCamera: Entity? = nil // 0x50
    private var audioMixerEntity: Entity? = nil // 0x58
    private var audioReverbEntity: Entity? = nil // 0x60
    private weak var activeCamera: Entity? = nil // 0x68
    private lazy var eventService: any EventService = { assertUnimplemented() }() // 0x70
    private var engineEventBus: REEventBus? = nil // 0x98
    private var updateEventCancellable: (any Cancellable)? = nil // 0xa0
    @MainActor @preconcurrency public private(set) lazy var __interactionService: any __RKEntityInteractionService = { assertUnimplemented() }() // 0xc8
    @MainActor @preconcurrency public var synchronizationService: (any SynchronizationService)? = nil // 0xd8
    
    @MainActor @preconcurrency public var __coreScene: __SceneRef {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var name: String {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    @MainActor @preconcurrency public func __addPostProcessingAudioEffect(_ auDesc: AudioComponentDescription) -> AUAudioUnit? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __defaultCamera: Entity! {
        get {
            assertUnimplemented()
        }
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
    
    init(coreScene: OpaquePointer) {
        unsafe self.coreScene = coreScene
        
#if RealityKitCompataibility
        unsafe unsafeBitCast(coreScene, to: CoreRE::Scene.self)
            .bridgedScene = self
#else
        unsafe unsafeBitCast(coreScene, to: CoreRE::Scene.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
#endif
    }
    
    deinit {
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
    
    nonisolated public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : Identifiable {
    nonisolated public var id: UInt64 {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ID = UInt64
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : EventSource {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene {
    @MainActor @preconcurrency public var __corePointer: OpaquePointer {
        get {
            assertUnimplemented()
        }
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
        get {
            assertUnimplemented()
        }
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
        get {
            assertUnimplemented()
            return self
        }
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
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func pixelCast(from startPosition: SIMD3<Float>, to endPosition: SIMD3<Float>) async throws -> PixelCastHit? {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene : Sendable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Scene.AnchorCollection : Sendable {}

extension Scene {
    @safe struct CorePublisher<T> : Combine::Publisher {
        typealias Output = T
        typealias Failure = Never
        
        private let sourceObject: OpaquePointer?
        private let componentType: OpaquePointer?
        private let dispatcher: REEventDispatcher<T>
        
        init(dispatcher: REEventDispatcher<T>, sourceObject: OpaquePointer?, componentType: OpaquePointer?) {
            unsafe self.sourceObject = sourceObject
            unsafe self.componentType = componentType
            self.dispatcher = dispatcher
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, T == S.Input {
            assertUnimplemented()
        }
    }
}

extension Scene.CorePublisher {
    fileprivate struct Inner<U> : Combine::CustomCombineIdentifierConvertible, Combine::Subscriber {
        typealias Input = U
        typealias Failure = Never
        
        private let downstream: U
        
        var combineIdentifier: CombineIdentifier {
            assertUnimplemented()
        }
        
        func receive(subscription: any Subscription) {
            assertUnimplemented()
        }
        
        func receive(_ input: Input) -> Subscribers.Demand {
            assertUnimplemented()
        }
        
        func receive(completion: Subscribers.Completion<Failure>) {
            assertUnimplemented()
        }
    }
}
