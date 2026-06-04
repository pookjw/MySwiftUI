@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ImpulseAction : EntityAction, Codable {
    public var targetEntity: ActionEntityResolution
    
    public var linearImpulse: SIMD3<Float>
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(targetEntity: ActionEntityResolution = .sourceEntity, linearImpulse: SIMD3<Float> = [0, 1, 0]) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
