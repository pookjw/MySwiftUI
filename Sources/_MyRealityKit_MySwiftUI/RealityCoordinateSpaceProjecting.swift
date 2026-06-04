public import MySwiftUICore
public import CoreGraphics
public import simd

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public protocol RealityCoordinateSpaceProjecting {
    func project(point: SIMD3<Float>, to space: some CoordinateSpaceProtocol) -> CGPoint?
    func unproject(_ point: CGPoint, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace, ontoPlane planeTransform: float4x4) -> SIMD3<Float>?
    func ray(through point: CGPoint, in space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> (origin: SIMD3<Float>, direction: SIMD3<Float>)?
    func entity(at point: CGPoint, in space: some CoordinateSpaceProtocol) -> Entity?
    func entities(at point: CGPoint, in space: some CoordinateSpaceProtocol) -> [Entity]
    func hitTest(point: CGPoint, in space: some CoordinateSpaceProtocol, query: CollisionCastQueryType, mask: CollisionGroup) -> [CollisionCastHit]
}
