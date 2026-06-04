public import MySwiftUICore

@available(visionOS 2.0, macOS 15.0, iOS 18.0, tvOS 26.0, *)
extension MeshResource.ShapeExtrusionOptions {
    public var chamferProfile: Path? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, tvOS 26.0, *)
extension MeshResource {
    @MainActor @preconcurrency convenience public init(extruding path: Path, extrusionOptions: MeshResource.ShapeExtrusionOptions = ShapeExtrusionOptions()) throws {
        assertUnimplemented()
    }
    
    nonisolated convenience public init(extruding path: Path, extrusionOptions: MeshResource.ShapeExtrusionOptions = ShapeExtrusionOptions()) async throws {
        assertUnimplemented()
    }
}
