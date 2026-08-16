internal import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency public protocol Resource : Sendable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Resource {
    public static func __fromCore(_ coreAsset: __AssetRef) -> Self {
        assertUnimplemented()
    }
}

protocol LoadableResource : Resource {
    init?(fromCore core: OpaquePointer)
}

extension LoadableResource {
    static func fromCore(assetRef: OpaquePointer) -> Self? {
        assertUnimplemented()
    }
    
    static func loadEngineResource(assetPath: String) -> Self {
        assertUnimplemented()
    }
    
    static func fromCoreAssetType(assetRef: OpaquePointer) -> Self? {
        assertUnimplemented()
    }
    
    static func getAssetRefFromRealityFileInBundle(named name: String, in bundle: Bundle?) throws -> __REAsset {
        assertUnimplemented()
    }
    
    static func getAssetFromRealityFileInBundle<T>(name: String, in bundle: Bundle?, getAsset: (String, URL) throws -> T) rethrows -> T {
        assertUnimplemented()
    }
}
