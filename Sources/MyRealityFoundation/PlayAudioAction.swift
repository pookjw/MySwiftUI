@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PlayAudioAction : EntityAction, Codable {
    public var targetEntity: ActionEntityResolution
    
    public var audioResourceName: String
    
    public var gain: Audio.Decibel
    
    @available(macOS, introduced: 15.0, deprecated: 15.0, renamed: "useControlledPlayback")
    @available(iOS, introduced: 18.0, deprecated: 18.0, renamed: "useControlledPlayback")
    @available(macCatalyst, introduced: 18.0, deprecated: 18.0, renamed: "useControlledPlayback")
    @available(visionOS, introduced: 2.0, deprecated: 2.0, renamed: "useControlledPlayback")
    @available(tvOS, introduced: 26.0, deprecated: 26.0, renamed: "useControlledPlayback")
    public var controlPlayback: Bool
    
    public var useControlledPlayback: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(targetEntity: ActionEntityResolution = .sourceEntity, audioResourceName: String, gain: Audio.Decibel = 0, controlPlayback: Bool = true) {
        assertUnimplemented()
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
