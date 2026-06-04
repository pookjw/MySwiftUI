public import AVFAudio

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioBufferResource {
    public struct Configuration {
        public var shouldLoop: Bool
        
        public var shouldRandomizeStartTime: Bool
        
        public var normalization: AudioResource.Normalization?
        
        public var calibration: AudioResource.Calibration?
        
        public var mixGroupName: String?
        
        public init(shouldLoop: Bool = false, shouldRandomizeStartTime: Bool = false, normalization: AudioResource.Normalization? = nil, calibration: AudioResource.Calibration? = nil, mixGroupName: String? = nil) {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioBufferResource.Configuration : Equatable, Hashable, Sendable {
    public static func == (a: AudioBufferResource.Configuration, b: AudioBufferResource.Configuration) -> Bool {
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

@_inheritsConvenienceInitializers @_hasMissingDesignatedInitializers @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@MainActor @preconcurrency public class AudioBufferResource : AudioResource {
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency final public let configuration: AudioBufferResource.Configuration = {
        assertUnimplemented()
    }()
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public init(buffer: AVAudioBuffer, configuration: AudioBufferResource.Configuration = .init()) throws {
        assertUnimplemented()
    }
    
    @available(tvOS, unavailable)
    @available(visionOS, introduced: 1.0, deprecated: 1.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(macOS, deprecated: 15.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(iOS, deprecated: 18.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @MainActor @preconcurrency public var shouldLoop: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, unavailable, introduced: 1.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(macOS, introduced: 12, deprecated: 15.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(macCatalyst, introduced: 15, deprecated: 18.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(iOS, introduced: 15, deprecated: 18.0, message: "Use AudioBufferResource.init(buffer:configuration:) instead.")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public init(buffer: AVAudioBuffer, inputMode: AudioResource.InputMode = .spatial, shouldLoop: Bool = false) throws {
        assertUnimplemented()
    }
    }

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioBufferResource : @MainActor Hashable {
    @MainActor @preconcurrency public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    nonisolated public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioBufferResource {
    @MainActor @preconcurrency public var duration: Duration {
        get {
            assertUnimplemented()
        }
    }
}
