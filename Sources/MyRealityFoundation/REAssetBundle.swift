public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __REAssetBundle {
    public static let __sdkBundleID: String = {
        assertUnimplemented()
    }()
    
    public static let __sdkBundleVersionKey: String = {
        assertUnimplemented()
    }()
    
    public static let __sdkBundleVersion: String = {
        assertUnimplemented()
    }()
    
    public static let __sdkBundleVersionInvalid: String = {
        assertUnimplemented()
    }()
    
    public static let __platform: String = {
        assertUnimplemented()
    }()
    
    public static let __fileExtension: String = {
        assertUnimplemented()
    }()
    
    public static var fileExtension: String {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "do not use")
    public struct Header : Codable {
        public struct VersionInfo : Codable {
            public func encode(to encoder: any Encoder) throws {
                assertUnimplemented()
            }
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public var versionInfo: __REAssetBundle.Header.VersionInfo
        
        public var minVersion: Int
        
        public func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public var sceneAssets: [__REAsset] {
        get {
            assertUnimplemented()
        }
    }
    
    public let __sceneAssets: [__REAsset]
    
    public var mainSceneAsset: __REAsset? {
        get {
            assertUnimplemented()
        }
    }
    
    public var __mainSceneAsset: __REAsset? {
        get {
            assertUnimplemented()
        }
    }
    
    public static func frameworkVersion(key: String) -> String {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be removed by end of January 2025 - rdar://136600358. Please use use __platform instead")
    public static func platform() -> String {
        assertUnimplemented()
    }
    
    public func mainSceneIdentifier() -> __REAssetIdentifier? {
        assertUnimplemented()
    }
    
    public enum QueueOptions : Equatable {
        case fromEngineQueue
        case notFromEngineQueue(canUseEngineQueue: Bool)
        
        public static func == (a: __REAssetBundle.QueueOptions, b: __REAssetBundle.QueueOptions) -> Bool {
            assertUnimplemented()
        }
    }
    
    public struct ExportOptions {
        public struct AssetRemapping {
            public let rawAssetPath: String
            
            public let replacementName: String
            
            public init(rawAssetPath: String, replacement: String) {
                assertUnimplemented()
            }
        }
        
        public var queueOptions: __REAssetBundle.QueueOptions
        
        public var compressionLevel: Int?
        
        public var progress: Progress?
        
        public var generateIdentifier: Bool
        
        public var deduplicateAssets: Bool
        
        public var __envelopeVersion: __AssetBundleEnvelopeVersion
        
        @available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
        public var deploymentTarget: __REAssetBundle.ExportOptions.DeploymentTarget?
        
        public var versionOverride: Int?
        
        public var useAutoVersioning: Bool
        
        public var restrictToSeed: Bool
        
        public var configurationSetNames: [String]?
        
        public var defaultConfigurationNames: [String]?
        
        public var sceneNamesToConfigurationSpecifications: [String : [String]]?
        
        public var assetsRemapping: [__REAssetBundle.ExportOptions.AssetRemapping]?
        
        public var makeSnapshotOfDynamicTextures: Bool
        
        @available(*, deprecated, message: "This SPI surface is under design review and is subject to change.")
        public var writeMeshesToVvmSidecars: Bool
        
        public init(queueOptions: __REAssetBundle.QueueOptions) {
            assertUnimplemented()
        }
    }
    
    public struct LoadOptions {
        public var queueOptions: __REAssetBundle.QueueOptions
        
        @available(*, deprecated, message: "will be removed")
        public var materialDefinition: __REAssetBundle.__MaterialDefinitionOverride?
        
        public var downsamplingStrategy: (any __DownsamplingStrategy)?
        
        public var performanceReport: __REArchivalStats?
        
        public var loadDedupeFile: Bool
        
        public var waitForResourceSharingClients: Bool
        
        public var loadOnResourceSharingClients: Bool
        
        public enum ContentRequest {
            case allScenes
            case mainScene
            case namedScene(String)
        }
        
        public var contentRequest: __REAssetBundle.LoadOptions.ContentRequest
        
        public init(queueOptions: __REAssetBundle.QueueOptions) {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "will be removed")
    public struct __MaterialDefinitionOverride {
        public init(materialDefinition: String, serviceLocator: OpaquePointer) {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Deprecated, kept only for compatibility. Use RERealityFileMountFileAtURL instead")
    public struct AssetMap : Codable {
        @available(*, deprecated, message: "Use RESceneDescriptorRef")
        public struct SceneDescriptor : Codable, Equatable {
            public static func == (a: __REAssetBundle.AssetMap.SceneDescriptor, b: __REAssetBundle.AssetMap.SceneDescriptor) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
                assertUnimplemented()
            }
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        @available(*, deprecated, message: "Use REAssetDescriptorRef")
        public struct AssetDescriptor : Codable {
            public func encode(to encoder: any Encoder) throws {
                assertUnimplemented()
            }
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public var scenes: [__REAssetBundle.AssetMap.SceneDescriptor]
        
        public var assets: [__REAssetBundle.AssetMap.AssetDescriptor]?
        
        public var certifiedFreeOfChangeSceneActions: Bool?
        
        public func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public static func __init(sceneAssets: [__REAsset], assetService: any __REAssetService) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Do not use, kept only for compatibility. Use __init that accepts [__REAsset: RESceneDescriptor] instead.")
    public static func __init(sceneAssets: [__REAsset], assetService: any __REAssetService, assetMapSceneDescriptorsByAsset: [__REAsset : __REAssetBundle.AssetMap.SceneDescriptor] = [:]) -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use __init(URL:__ServiceLocator:LoadOptions)")
    public init(url: URL, assetService: any __REAssetService, with queueOptions: __REAssetBundle.QueueOptions = .fromEngineQueue) throws {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use __init(URL:__ServiceLocator:LoadOptions)")
    public static func __init(url: URL, assetService: any __REAssetService, _ options: __REAssetBundle.LoadOptions) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    public static func __init(url: URL, serviceLocator: __ServiceLocator, _ options: __REAssetBundle.LoadOptions) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use __init(Bundle:String:__ServiceLocator:LoadOptions)")
    public static func __init(bundle: Bundle, entryName: String, assetService: any __REAssetService, _ options: __REAssetBundle.LoadOptions) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    public static func __init(bundle: Bundle, entryName: String, serviceLocator: __ServiceLocator, _ options: __REAssetBundle.LoadOptions) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use __init(URL:__ServiceLocator:LoadOptions)")
    public static func __init(url: URL, assetService: any __REAssetService, materialDefinition: __REAssetBundle.__MaterialDefinitionOverride? = nil, with queueOptions: __REAssetBundle.QueueOptions = .fromEngineQueue) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "will be moved to internal; use __init(URL:__ServiceLocator:LoadOptions)")
    public init(url: URL, assetService: any __REAssetService, downsamplingStrategy: (any __DownsamplingStrategy)?, with options: __REAssetBundle.QueueOptions) throws {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "use load(url:assetService:completionHandler:) instead")
    public static func load(url: URL, assetService: any __REAssetService, materialDefinition: __REAssetBundle.__MaterialDefinitionOverride? = nil, completionHandler: @escaping (Result<__REAssetBundle, any Error>) -> Void) {
        assertUnimplemented()
    }
    
    public static func load(url: URL, serviceLocator: __ServiceLocator, completionHandler: @escaping (Result<__REAssetBundle, any Error>) -> Void) {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use load(Bundle:String:__ServiceLocator:LoadOptions)")
    public static func load(bundle: Bundle, entryName: String, assetService: any __REAssetService, completionHandler: @escaping (Result<__REAssetBundle, any Error>) -> Void) {
        assertUnimplemented()
    }
    
    public static func load(bundle: Bundle, entryName: String, serviceLocator: __ServiceLocator, completionHandler: @escaping (Result<__REAssetBundle, any Error>) -> Void) {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use getSceneDescriptors")
    public var sceneDescriptors: [__REAssetBundle.AssetMap.SceneDescriptor] {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Use sceneAsset(for sceneDescriptor: RESceneDescriptor)")
    public func sceneAsset(for sceneDescriptor: __REAssetBundle.AssetMap.SceneDescriptor) -> __REAsset? {
        assertUnimplemented()
    }
    
    @safe public static nonisolated(unsafe) let temporaryURL: URL = {
        assertUnimplemented()
    }()
    
    public func write(to url: URL) throws {
        assertUnimplemented()
    }
    
    public func __write(to url: URL, fromEngineQueue: Bool = true) throws {
        assertUnimplemented()
    }
    
    public func write(to url: URL, with options: __REAssetBundle.ExportOptions) throws {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "use __write(to:with:) instead")
    public func __write(to url: URL, with queueOptions: __REAssetBundle.QueueOptions, compressionLevel: Int? = 1, progress: Progress? = nil) throws {
        assertUnimplemented()
    }
    
    public func __write(to url: URL, with options: __REAssetBundle.ExportOptions) throws {
        assertUnimplemented()
    }
    
    public func __write(to url: URL, completionHandler: @escaping ((any Error)?) -> Void) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAssetBundle {
    @preconcurrency @MainActor public static func __init(element: Entity, assetService: any __REAssetService) -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @MainActor public static func __init(elements: [Entity], assetService: any __REAssetService) -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func __init(realityScenes: [Scene], assetService: any __REAssetService) -> __REAssetBundle {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "use RERealityFileMountFileAtURL and pull same content from it")
    public static func loadAssetMap(url: URL) throws -> __REAssetBundle.AssetMap {
        assertUnimplemented()
    }
}

@available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
extension __REAssetBundle.ExportOptions {
    public enum PlatformOS : RawRepresentable, Hashable, Sendable {
        case iOS
        case macOS
        case visionOS
        @available(*, deprecated, message: "will be removed please use visionOS")
        case xrOS
        case tvOS
        case custom(_: String)
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
        
        @available(iOS 16.0, tvOS 26.0, macOS 13.0, macCatalyst 16.0, *)
        public typealias RawValue = String
    }
    
    public enum PlatformRequirement {
        case none
        case deploymentTargetOS
        
        public static func == (a: __REAssetBundle.ExportOptions.PlatformRequirement, b: __REAssetBundle.ExportOptions.PlatformRequirement) -> Bool {
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
    
    public struct DeploymentTarget {
        public let platform: __REAssetBundle.ExportOptions.PlatformOS
        
        public let version: (major: Int32, minor: Int32, patch: Int32)
        
        public let platformRequirement: __REAssetBundle.ExportOptions.PlatformRequirement
        
        public init(platform: __REAssetBundle.ExportOptions.PlatformOS, version: (major: Int32, minor: Int32, patch: Int32)) {
            assertUnimplemented()
        }
        
        public init?(platform: __REAssetBundle.ExportOptions.PlatformOS, version: (major: Int32, minor: Int32, patch: Int32), platformRequirement: __REAssetBundle.ExportOptions.PlatformRequirement) {
            assertUnimplemented()
        }
    }
}

@available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
extension __REAssetBundle.ExportOptions.PlatformRequirement : Equatable {}

@available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
extension __REAssetBundle.ExportOptions.PlatformRequirement : Hashable {}
