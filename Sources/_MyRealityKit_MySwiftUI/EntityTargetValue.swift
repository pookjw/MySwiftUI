public import MySwiftUICore
public import CoreGraphics
public import simd
public import Spatial

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, *)
@available(visionOS, unavailable, introduced: 2.0)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EntityTargetValue : RealityCoordinateSpaceProjecting {
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

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, *)
@available(visionOS, unavailable, introduced: 2.0)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EntityTargetValue {
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func unproject(_ keyPath: KeyPath<Value, CGPoint>, to realitySpace: some RealityCoordinateSpace) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 2.0)
    public func unproject(_ point: CGPoint, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> SIMD3<Float>? {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EntityTargetValue : RealityCoordinateSpaceConverting {
    public func transform(from: some RealityCoordinateSpace, to: some CoordinateSpaceProtocol) -> AffineTransform3D {
        assertUnimplemented()
    }
    
    public func transform(from: some CoordinateSpaceProtocol, to: some RealityCoordinateSpace) -> AffineTransform3D {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@dynamicMemberLookup public struct EntityTargetValue<Value> {
    public var gestureValue: Value
    
    public var entity: Entity
    
    public subscript<T>(dynamicMember keyPath: KeyPath<Value, T>) -> T {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EntityTargetValue : Equatable where Value : Equatable {
    public static func == (lhs: EntityTargetValue<Value>, rhs: EntityTargetValue<Value>) -> Bool {
        assertUnimplemented()
    }
}
