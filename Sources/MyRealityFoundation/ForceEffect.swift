public import simd

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ForceEffect<ForceEffectType> : ForceEffectBase where ForceEffectType : ForceEffectProtocol {
    public init(effect: ForceEffectType, strengthScale: Double = 1.0, spatialFalloff: SpatialForceFalloff? = nil, timedFalloff: TimedForceFalloff? = nil, position: SIMD3<Float> = SIMD3<Float>(0, 0, 0), orientation: simd_quatf = simd_quaternion(0, 0, 0, 1), mask: CollisionGroup = .all) {
        assertUnimplemented()
    }
    
    public var effect: ForceEffectType
    
    public var spatialFalloff: SpatialForceFalloff?
    
    public var timedFalloff: TimedForceFalloff?
    
    public var position: SIMD3<Float>
    
    public var orientation: simd_quatf
    
    public var strengthScale: Float
    
    public var mask: CollisionGroup
}
