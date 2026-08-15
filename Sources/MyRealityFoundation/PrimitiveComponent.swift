internal import CoreRE

@MainActor protocol PrimitiveComponentType {
    associatedtype Options
    
    var primitiveOptions: Self.Options { get set }
    var splitMeshes: Bool { get set }
    static func makeDescriptor(options: Self.Options, splitMeshes: Bool) -> OpaquePointer
    var removeCollision: Bool { get }
    func copyToComponent(component: OpaquePointer)
    init(coreAsset: OpaquePointer)
}

extension PrimitiveComponentType {
    static func makeCoreAsset(options: Self.Options, splitMeshes: Bool) -> OpaquePointer {
        assertUnimplemented()
    }
    
    init(options: Self.Options, splitMeshes: Bool) {
        assertUnimplemented()
    }
}

extension PrimitiveComponentType where Self == SphereMeshResource {
    static func makeCoreAsset(options: Self.Options, splitMeshes: Bool) -> OpaquePointer {
        // x23
        let handle_1 = unsafe __ServiceLocator.shared.assetService.__handle
        // x20
        let handle_2 = unsafe __ServiceLocator.shared.assetService.__handle
        
        var descriptor = unsafe unsafeBitCast(handle_2, to: CoreRE::AssetManager.self)
            .createSphereDescriptor(options, splitMeshes)
        let asset = unsafe unsafeBitCast(handle_1, to: CoreRE::AssetManager.self)
            .createNewMutableWithAssetDescriptors(&descriptor, 1)
        
        unsafe __RERelease(unsafeBitCast(descriptor, to: OpaquePointer.self))
        return unsafe unsafeBitCast(asset, to: OpaquePointer.self)
    }
    
    init(options: CoreRE::GeomBuildSphereOptions, splitMeshes: Bool) {
        _ = unsafe __ServiceLocator.shared.assetService.__handle
        
        let reAsset = unsafe unsafeBitCast(
            Self.makeCoreAsset(
                options: options,
                splitMeshes: splitMeshes
            ),
            to: CoreRE::Asset.self
        )
        
#if RealityKitCompatibility
        assert(reAsset.myRealityKitRef == nil)
#else
        unsafe assert(reAsset.swiftObject == nil)
#endif
        
        reAsset.handleLoadNow()
        reAsset.setNetworkSharingMode(.unknown0)
        
        unsafe self.init(coreAsset: unsafeBitCast(reAsset, to: OpaquePointer.self))
        self.primitiveOptions = options
        self.splitMeshes = splitMeshes
        
        unsafe __RERelease(unsafeBitCast(reAsset, to: OpaquePointer.self))
    }
}
