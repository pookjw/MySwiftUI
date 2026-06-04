public import CoreGraphics
public import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class EnvironmentResource : Resource {
    @MainActor @preconcurrency public static let __compiledExtension: String = {
        assertUnimplemented()
    }()
    
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil) throws -> EnvironmentResource {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "init(named:in:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(named:in:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<EnvironmentResource> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __load(contentsOf url: URL, withName resourceName: String? = nil) throws -> EnvironmentResource {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(macOS, unavailable, introduced: 15.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(iOS, unavailable, introduced: 18.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(macCatalyst, unavailable, introduced: 18.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor @preconcurrency public static func generate(fromEquirectangular cgImage: CGImage, withName resourceName: String? = nil) throws -> EnvironmentResource {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(macOS, unavailable, introduced: 15.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(iOS, unavailable, introduced: 18.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(macCatalyst, unavailable, introduced: 18.0, renamed: "EnvironmentResource.init(equirectangular:withName:)")
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor @preconcurrency public static func generate(fromEquirectangular cgImage: CGImage, withName resourceName: String? = nil) async throws -> EnvironmentResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromAssets(_ coreIBLAsset: __AssetRef?, _ coreSkyboxAsset: __AssetRef?) -> EnvironmentResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __exportCompiledResource(contentsOf inURL: URL, to outURL: URL) throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension EnvironmentResource {
    @MainActor @preconcurrency convenience public init(named name: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var skybox: TextureResource {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension EnvironmentResource {
    @MainActor @preconcurrency convenience public init(cube cubeTexture: TextureResource, options: EnvironmentResource.CreateOptions) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(equirectangular cgImage: CGImage, withName resourceName: String? = nil) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(equirectangular cgImage: CGImage, withName resourceName: String? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(cube cubeTexture: TextureResource, options: EnvironmentResource.CreateOptions) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension EnvironmentResource {
    public typealias Compression = TextureResource.Compression
    
    public struct CreateOptions : Hashable, Sendable {
        public enum SamplingQuality : Hashable, Sendable {
            case fast
            case normal
            
            public static func == (a: EnvironmentResource.CreateOptions.SamplingQuality, b: EnvironmentResource.CreateOptions.SamplingQuality) -> Bool {
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
        
        public var compression: EnvironmentResource.Compression
        
        public var samplingQuality: EnvironmentResource.CreateOptions.SamplingQuality
        
        public var specularCubeDimension: Int?
        
        public init(samplingQuality: EnvironmentResource.CreateOptions.SamplingQuality = .fast, specularCubeDimension: Int? = nil, compression: EnvironmentResource.Compression = .default) {
            assertUnimplemented()
        }
        
        public static func == (a: EnvironmentResource.CreateOptions, b: EnvironmentResource.CreateOptions) -> Bool {
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
