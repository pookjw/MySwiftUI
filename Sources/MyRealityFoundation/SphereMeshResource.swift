internal import CoreRE

final class SphereMeshResource : MeshResource {
    var primitiveOptions: CoreRE::GeomBuildSphereOptions // 0x18
    var splitMeshes: Bool // 0x24
    
    override init(coreAsset: OpaquePointer) {
        self.primitiveOptions = CoreRE::GeomBuildSphereOptions.defaultOptions
        self.splitMeshes = false
        unsafe super.init(coreAsset: coreAsset)
    }
    
    override init(_ coreAsset: OpaquePointer?) {
        self.primitiveOptions = CoreRE::GeomBuildSphereOptions.defaultOptions
        self.splitMeshes = false
        unsafe super.init(coreAsset)
    }
}

extension SphereMeshResource : PrimitiveComponentType {
    typealias Options = CoreRE::GeomBuildSphereOptions
    
    static nonisolated func makeDescriptor(options: CoreRE::GeomBuildSphereOptions, splitMeshes: Bool) -> OpaquePointer {
        assertUnimplemented()
    }
    
    nonisolated var removeCollision: Bool {
        assertUnimplemented()
    }
    
    nonisolated func copyToComponent(component: OpaquePointer) {
        assertUnimplemented()
    }
}
