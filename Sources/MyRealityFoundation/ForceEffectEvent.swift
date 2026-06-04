@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ForceEffectEvent<ForceEffectType> where ForceEffectType : ForceEffectProtocol {
    public var effect: ForceEffectType
    
    public var parameters: ForceEffectParameters
}
