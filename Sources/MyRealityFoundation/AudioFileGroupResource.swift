public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileGroupResource {
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead.")
    @MainActor @preconcurrency public static func load(named name: String, from scene: String, in bundle: Bundle? = nil) throws -> AudioFileGroupResource {
        assertUnimplemented()
    }
}

@_inheritsConvenienceInitializers @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@MainActor @preconcurrency public class AudioFileGroupResource : AudioResource {
    @MainActor @preconcurrency final public let resources: [AudioFileResource] = {
        assertUnimplemented()
    }()
    
    @MainActor @preconcurrency convenience public init(named name: String, from scene: String, in bundle: Bundle) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(_ resources: [AudioFileResource]) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func == (lhs: AudioFileGroupResource, rhs: AudioFileGroupResource) -> Bool {
        assertUnimplemented()
    }
    }

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioFileGroupResource : @MainActor Hashable {
    @MainActor @preconcurrency public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    nonisolated public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
