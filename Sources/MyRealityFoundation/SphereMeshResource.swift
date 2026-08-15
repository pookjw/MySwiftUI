internal import CoreRE

final class SphereMeshResource : MeshResource {
    var primitiveOptions: CoreRE::GeomBuildSphereOptions // 0x18
    var splitMeshes: Bool // 0x24
    
    override init(coreAsset: OpaquePointer) {
        assertUnimplemented()
    }
    
    override init(_ coreAsset: OpaquePointer?) {
        assertUnimplemented()
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
