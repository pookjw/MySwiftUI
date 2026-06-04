public import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class AudioPlaybackController {
    @MainActor @preconcurrency weak public var entity: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency final public let resource: AudioResource = {
        assertUnimplemented()
    }()
    
    @MainActor @preconcurrency public var completionHandler: (() -> Void)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension AudioPlaybackController {
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "Audio.Decibel")
    @available(iOS, introduced: 13, deprecated: 18.0, renamed: "Audio.Decibel")
    @available(tvOS, deprecated: 26.0, renamed: "Audio.Decibel")
    @available(visionOS, deprecated, renamed: "Audio.Decibel")
    public typealias Decibel = Double
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioPlaybackController {
    @MainActor @preconcurrency public var speed: Double {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var gain: AudioPlaybackController.Decibel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func fade(to newValue: AudioPlaybackController.Decibel, duration: TimeInterval) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    @available(macOS, introduced: 10.15, deprecated: 15.0, message: "Use SpatialAudioComponent.reverbLevel instead.")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, message: "Use SpatialAudioComponent.reverbLevel instead.")
    @available(iOS, introduced: 13.0, deprecated: 18.0, message: "Use SpatialAudioComponent.reverbLevel instead.")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var reverbSendLevel: AudioPlaybackController.Decibel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioPlaybackController {
    @MainActor @preconcurrency public var isPlaying: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func play() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func pause() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func stop() {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioPlaybackController {
    @MainActor @preconcurrency public var __playbackPosition: TimeInterval {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioPlaybackController : @MainActor Identifiable {
    @MainActor @preconcurrency public var id: UInt64 {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ID = UInt64
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension AudioPlaybackController {
    @MainActor @preconcurrency public func seek(to time: Duration) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioPlaybackController : Sendable {}
