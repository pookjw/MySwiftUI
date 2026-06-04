public import CoreGraphics

@_hasMissingDesignatedInitializers @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
@preconcurrency @MainActor public class VideoPlaybackController {
    @available(visionOS, unavailable)
    @available(macOS, introduced: 11, deprecated: 14, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(macCatalyst, introduced: 14, deprecated: 17, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(iOS, introduced: 14, deprecated: 17, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var audioInputMode: AudioResource.InputMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    }

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlaybackController {
    public enum ViewingMode : Sendable {
        case mono
        @available(visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        case stereo
        
        public static func == (a: VideoPlaybackController.ViewingMode, b: VideoPlaybackController.ViewingMode) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @MainActor @preconcurrency public var preferredViewingMode: VideoPlaybackController.ViewingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var currentViewingMode: VideoPlaybackController.ViewingMode? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var currentImageSize: CGSize? {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS, unavailable, introduced: 1.0, message: "Use ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(macOS, introduced: 12.0, deprecated: 15.0, message: "Use ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(macCatalyst, introduced: 15.0, deprecated: 18.0, message: "Use ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(iOS, introduced: 15.0, deprecated: 18.0, message: "Use ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(tvOS, unavailable, message: "Use ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
extension VideoPlaybackController {
    @MainActor @preconcurrency public var reverbSendLevel: AudioPlaybackController.Decibel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
extension VideoPlaybackController : Sendable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlaybackController.ViewingMode : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlaybackController.ViewingMode : Hashable {}
