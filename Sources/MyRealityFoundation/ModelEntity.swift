@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class ModelEntity : Entity, HasModel, HasPhysics {
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = []) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = [], collisionShape: ShapeResource, mass: Float) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = [], collisionShapes: [ShapeResource], mass: Float) {
        assertUnimplemented()
    }
    }
