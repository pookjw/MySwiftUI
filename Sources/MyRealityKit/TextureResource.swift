public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension TextureResource {
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "init(named:in:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(named:in:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource {
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(named:in:options:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(named:in:options:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(named:in:options:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(named:in:options:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(named name: String, in bundle: Bundle? = nil, options: TextureResource.CreateOptions) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(named name: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(named name: String, in bundle: Bundle? = nil, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
}
