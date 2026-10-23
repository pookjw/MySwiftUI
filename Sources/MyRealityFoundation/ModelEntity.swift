private import CoreRE
internal import Foundation

@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class ModelEntity : Entity, HasModel, HasPhysics {
    override class func classLoad(named name: String, in bundle: Bundle?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

    override class func classLoad(contentsOf url: URL, withName name: String?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

    override class func classLoad(from data: Data, named name: String?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

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
