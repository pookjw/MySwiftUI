public import simd

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol ForceEffectBase {
    associatedtype ForceEffectType : ForceEffectProtocol
    var effect: Self.ForceEffectType { get }
    var spatialFalloff: SpatialForceFalloff? { get }
    var timedFalloff: TimedForceFalloff? { get }
    var position: SIMD3<Float> { get }
    var orientation: simd_quatf { get }
    var strengthScale: Float { get }
    var mask: CollisionGroup { get }
}
