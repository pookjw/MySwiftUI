public import MySwiftUICore
public import CoreGraphics
public import simd

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable, introduced: 2.0)
@available(watchOS, unavailable)
extension RealityViewCameraContent : RealityCoordinateSpaceProjecting {
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func project(point: SIMD3<Float>, to space: some CoordinateSpaceProtocol) -> CGPoint? {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func unproject(_ point: CGPoint, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace, ontoPlane: float4x4) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func ray(through: CGPoint, in space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> (origin: SIMD3<Float>, direction: SIMD3<Float>)? {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func entity(at point: CGPoint, in space: some CoordinateSpaceProtocol) -> Entity? {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func entities(at point: CGPoint, in space: some CoordinateSpaceProtocol) -> [Entity] {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func hitTest(point: CGPoint, in space: some CoordinateSpaceProtocol, query: CollisionCastQueryType = .all, mask: CollisionGroup = .all) -> [CollisionCastHit] {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension RealityViewCameraContent {
    @MainActor @preconcurrency public struct Body<Placeholder> : View where Placeholder : View {
        @MainActor @preconcurrency public var body: some View {
            get {
                assertUnimplemented()
            }
        }
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewCameraContent : RealityViewContentProtocol {
    public var entities: RealityViewEntityCollection {
        get {
            assertUnimplemented()
        }
        nonmutating set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public var camera: RealityViewCamera {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public var cameraTarget: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public var environment: RealityViewEnvironment {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public var audioListener: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    public var renderingEffects: RealityViewRenderingEffects {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)?, componentType: (any Component.Type)?, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, macOS 15.0, macCatalyst 18.0, *)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias Entities = RealityViewEntityCollection
}

@available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@MainActor extension RealityViewCameraContent {
    @MainActor public func animate(body: () -> Void, completion: (() -> Void)? = nil) {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension RealityViewCameraContent.Body : Sendable {}
