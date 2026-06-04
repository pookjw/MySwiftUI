@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct LensDistortionData : Sendable {
    public let center: SIMD2<Float>
    
    public let radialLookupTable: [Float]
    
    public init(center: SIMD2<Float>, radialLookupTable: [Float]) {
        assertUnimplemented()
    }
}
