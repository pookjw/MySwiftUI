internal import Foundation
private import CoreRE

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

extension LoadableResource where Self == __MaterialResource {
    static func fromCore(assetRef: OpaquePointer) -> Self? {
        let resource: __MaterialResource?
#if RealityKitCompatibility
        resource = unsafe unsafeBitCast(assetRef, to: CoreRE::Asset.self)
            .myRealityKitRef as? __MaterialResource
#else
        if let swiftObject = unsafe unsafeBitCast(assetRef, to: CoreRE::Asset.self).swiftObject {
            resource = unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as? __MaterialResource
        } else {
            resource = nil
        }
#endif
        
        if let resource {
            return resource
        }
        
        return unsafe __MaterialResource(fromCore: assetRef)
    }
    
    static func loadEngineResource(assetPath: String) -> Self {
        guard let asset = __ServiceLocator.shared.assetService.asset(assetPath) else {
            assertionFailure("Could not load resource at path \(assetPath)")
        }
        
        guard let resource = unsafe Self.fromCore(assetRef: asset.handle) else {
            assertionFailure("Could not load resource at path \(assetPath)")
        }
        
        return resource
    }
}
