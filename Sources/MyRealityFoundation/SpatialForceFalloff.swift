@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct SpatialForceFalloff {
    public init(bounds: ForceEffectBounds, rate: Double = 1.0, distanceOffset: Double = 0) {
        assertUnimplemented()
    }
    
    public var distanceOffset: Double
    
    public var bounds: ForceEffectBounds
    
    public var rate: Double
}
