@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewRenderingEffects : Sendable {
    public var motionBlur: RealityViewRenderingEffectMode
    
    public var depthOfField: RealityViewRenderingEffectMode
    
    public var cameraGrain: RealityViewRenderingEffectMode
    
    public var antialiasing: AntialiasingMode
    
    public var dynamicRange: RealityViewDynamicRange
    
    @available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    public var customPostProcessing: RealityViewPostProcessEffect
}
