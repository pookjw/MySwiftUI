@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PlayAudioAction : EntityAction, Codable {
    public var targetEntity: ActionEntityResolution
    
    public var audioResourceName: String
    
    public var gain: Audio.Decibel
    
    public var useControlledPlayback: Bool
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(targetEntity: ActionEntityResolution = .sourceEntity, audioResourceName: String, gain: Audio.Decibel = 0, useControlledPlayback: Bool = true) {
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
