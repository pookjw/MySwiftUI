// DFB0278B603FAE594499C9FBDD2D3073
public import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class __VideoResource : Resource {
    private let coreAssetInternal: OpaquePointer
    private var entityRefs: [__VideoResource.Weak<MyRealityFoundation::Entity>]
    
    private init() {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public static func __fromCore(_ coreAsset: __AssetRef) -> Self {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil) throws -> __VideoResource {
        assertUnimplemented()
    }
    
    final func addEntity(_: MyRealityFoundation::Entity) {
        assertUnimplemented()
    }
    
    fileprivate final func removeNilEntries() {
        assertUnimplemented()
    }
}

extension __VideoResource {
    final class Weak<T : AnyObject> {
        private weak var value: T?
    }
}
