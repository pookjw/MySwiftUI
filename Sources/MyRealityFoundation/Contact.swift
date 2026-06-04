@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct Contact : Sendable {
    public let point: SIMD3<Float>
    
    public let normal: SIMD3<Float>
    
    public let impulse: Float
    
    public let impulseDirection: SIMD3<Float>
    
    public let penetrationDistance: Float
}
