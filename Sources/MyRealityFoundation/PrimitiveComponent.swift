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
        assertUnimplemented()
    }
    
    init(options: Self.Options, splitMeshes: Bool) {
        assertUnimplemented()
    }
}
