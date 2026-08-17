private import CoreRE

@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class ModelEntity : Entity, HasModel, HasPhysics {
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = []) {
        super.init()
        self.components.set(ModelComponent(mesh: mesh, materials: materials))
        
        if REShadowsGetEnableDefaultShadows() {
            let reEntity = unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self)
            REProjectiveShadowReceiverComponentAddToEntity(reEntity, true)
        }
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = [], collisionShape: ShapeResource, mass: Float) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(mesh: MeshResource, materials: [any Material] = [], collisionShapes: [ShapeResource], mass: Float) {
        assertUnimplemented()
    }
    }
