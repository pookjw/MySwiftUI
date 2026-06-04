public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioFileResource {
    public enum LoadingStrategy {
        case stream
        case preload
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioFileResource.LoadingStrategy : Hashable {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension AudioFileResource.LoadingStrategy : Codable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource.LoadingStrategy : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource.LoadingStrategy : RawRepresentable {
    public var rawValue: String {
        get {
            assertUnimplemented()
        }
    }
    
    public init?(rawValue: String) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias RawValue = String
}

@_inheritsConvenienceInitializers @_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@MainActor @preconcurrency public class AudioFileResource : AudioResource {
    @MainActor @preconcurrency final public let name: String = {
        assertUnimplemented()
    }()
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency final public let configuration: AudioFileResource.Configuration = {
        assertUnimplemented()
    }()
    
    @available(visionOS, introduced: 2.0, deprecated: 1.0, message: "Use configuration.loadingStrategy instead.")
    @available(macOS, introduced: 10.15, deprecated: 15.0, message: "Use configuration.loadingStrategy instead.")
    @available(macCatalyst, introduced: 13, deprecated: 18.0, message: "Use configuration.loadingStrategy instead.")
    @available(iOS, introduced: 13, deprecated: 18.0, message: "Use configuration.loadingStrategy instead.")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var loadingStrategy: AudioFileResource.LoadingStrategy {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, introduced: 2.0, deprecated: 1.0, message: "Use configuration.shouldLoop instead.")
    @available(macOS, introduced: 10.15, deprecated: 15.0, message: "Use configuration.shouldLoop instead.")
    @available(macCatalyst, introduced: 13, deprecated: 18.0, message: "Use configuration.shouldLoop instead.")
    @available(iOS, introduced: 13, deprecated: 18.0, message: "Use configuration.shouldLoop instead.")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var shouldLoop: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    }

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource : @MainActor Hashable {
    @MainActor @preconcurrency public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    nonisolated public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AudioFileResource {
    @available(visionOS, introduced: 2.0, deprecated: 1.0, message: "duration")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "duration")
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "duration")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "duration")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var __duration: TimeInterval {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public var duration: Duration {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func == (lhs: AudioFileResource, rhs: AudioFileResource) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource {
    @MainActor @preconcurrency convenience public init(named name: String, in bundle: Bundle? = nil, configuration: AudioFileResource.Configuration = .init()) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(named name: String, from scene: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(contentsOf url: URL, withName resourceName: String? = nil, configuration: AudioFileResource.Configuration = .init()) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource {
    public struct Configuration {
        public var loadingStrategy: AudioFileResource.LoadingStrategy
        
        public var shouldLoop: Bool
        
        public var shouldRandomizeStartTime: Bool
        
        public var normalization: AudioResource.Normalization?
        
        public var calibration: AudioResource.Calibration?
        
        public var mixGroupName: String?
        
        public init(loadingStrategy: AudioFileResource.LoadingStrategy = .preload, shouldLoop: Bool = false, shouldRandomizeStartTime: Bool = false, normalization: AudioResource.Normalization? = nil, calibration: AudioResource.Calibration? = nil, mixGroupName: String? = nil) {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource.Configuration : Equatable, Hashable, Sendable {
    public static func == (a: AudioFileResource.Configuration, b: AudioFileResource.Configuration) -> Bool {
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

@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AudioFileResource.load(named:in:configuration:)")
@available(macCatalyst, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.load(named:in:configuration:)")
@available(iOS, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.load(named:in:configuration:)")
extension AudioFileResource {
    @_disfavoredOverload @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil, inputMode: AudioResource.InputMode = .spatial, loadingStrategy: AudioFileResource.LoadingStrategy = .preload, shouldLoop: Bool = false) throws -> AudioFileResource {
        assertUnimplemented()
    }
}

@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AudioFileResource.load(contentsOf:withName:configuration:)")
@available(macCatalyst, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.load(contentsOf:withName:configuration:)")
@available(iOS, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.load(contentsOf:withName:configuration:)")
extension AudioFileResource {
    @_disfavoredOverload @MainActor @preconcurrency public static func load(contentsOf url: URL, withName resourceName: String? = nil, inputMode: AudioResource.InputMode = .spatial, loadingStrategy: AudioFileResource.LoadingStrategy = .preload, shouldLoop: Bool = false) throws -> AudioFileResource {
        assertUnimplemented()
    }
}

@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AudioFileResource.init(named:in:configuration:)")
@available(macCatalyst, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.init(named:in:configuration:)")
@available(iOS, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.init(named:in:configuration:)")
extension AudioFileResource {
    @_disfavoredOverload @MainActor @preconcurrency public static func loadAsync(named name: String, in bundle: Bundle? = nil, inputMode: AudioResource.InputMode = .spatial, loadingStrategy: AudioFileResource.LoadingStrategy = .preload, shouldLoop: Bool = false) -> LoadRequest<AudioFileResource> {
        assertUnimplemented()
    }
}

@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AudioFileResource.init(contentsOf:withName:configuration:)")
@available(macCatalyst, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.init(contentsOf:withName:configuration:)")
@available(iOS, introduced: 13, deprecated: 18.0, renamed: "AudioFileResource.init(contentsOf:withName:configuration:)")
extension AudioFileResource {
    @_disfavoredOverload @MainActor @preconcurrency public static func loadAsync(contentsOf url: URL, withName resourceName: String? = nil, inputMode: AudioResource.InputMode = .spatial, loadingStrategy: AudioFileResource.LoadingStrategy = .preload, shouldLoop: Bool = false) -> LoadRequest<AudioFileResource> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileResource {
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead.")
    @MainActor @preconcurrency public static func load(contentsOf url: URL, withName name: String? = nil, configuration: AudioFileResource.Configuration = .init()) throws -> AudioFileResource {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead.")
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil, configuration: AudioFileResource.Configuration = .init()) throws -> AudioFileResource {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead.")
    @MainActor @preconcurrency public static func load(named name: String, from scene: String, in bundle: Bundle? = nil) throws -> AudioFileResource {
        assertUnimplemented()
    }
}
