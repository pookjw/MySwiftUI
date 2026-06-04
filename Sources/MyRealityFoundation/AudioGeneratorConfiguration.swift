public import CoreAudioTypes

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct AudioGeneratorConfiguration {
    public var layoutTag: CoreAudioTypes.AudioChannelLayoutTag
    
    public var mixGroupName: String?
    
    public init(layoutTag: CoreAudioTypes.AudioChannelLayoutTag = kAudioChannelLayoutTag_Mono, mixGroupName: String? = nil) {
        assertUnimplemented()
    }
}
