@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioResource {
    @available(visionOS, unavailable)
    @available(macOS, introduced: 10.15, deprecated: 13.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(macCatalyst, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(iOS, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(tvOS, introduced: 26.0, deprecated: 26.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    public enum InputMode {
        case nonSpatial
        case spatial
        case ambient
        
        public static func == (a: AudioResource.InputMode, b: AudioResource.InputMode) -> Bool {
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
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioResource {
    public struct Normalization {
        @safe public static nonisolated(unsafe) let dynamic: AudioResource.Normalization = {
            assertUnimplemented()
        }()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioResource.Normalization : Equatable, Hashable, Sendable {
    public static func == (a: AudioResource.Normalization, b: AudioResource.Normalization) -> Bool {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioResource {
    public struct Calibration {
        public static func relative(dBSPL: Audio.Decibel) -> AudioResource.Calibration {
            assertUnimplemented()
        }
        
        public static func absolute(dBSPL: Audio.Decibel) -> AudioResource.Calibration {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioResource.Calibration : Equatable, Hashable, Sendable {
    public static func == (a: AudioResource.Calibration, b: AudioResource.Calibration) -> Bool {
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

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class AudioResource : Resource {
    @MainActor @preconcurrency public var __coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, introduced: 10.15, deprecated: 15.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(macCatalyst, introduced: 13, deprecated: 18.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @available(iOS, introduced: 13, deprecated: 18.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
    @MainActor @preconcurrency public var inputMode: AudioResource.InputMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioResource : @MainActor Equatable {
    @MainActor @preconcurrency public static func == (lhs: AudioResource, rhs: AudioResource) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 13.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(macCatalyst, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(iOS, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(tvOS, introduced: 26.0, deprecated: 26.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
extension AudioResource.InputMode : Equatable {}

@available(visionOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 13.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(macCatalyst, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(iOS, introduced: 13.0, deprecated: 16.3, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
@available(tvOS, introduced: 26.0, deprecated: 26.0, message: "Use the ChannelAudioComponent, AmbientAudioComponent, or SpatialAudioComponent instead.")
extension AudioResource.InputMode : Hashable {}
