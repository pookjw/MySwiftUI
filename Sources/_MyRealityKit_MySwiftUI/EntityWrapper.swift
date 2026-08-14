private import MyRealityFoundation
@_spi(Internal) internal import MySwiftUI
internal import Spatial
#if RealityKitCompatibility
internal import RealityKit
private import CoreRE
#endif

struct EntityWrapper : EntityRepresentable {
#if RealityKitCompatibility
    typealias EntityType = RealityKit::Entity
#else
    typealias EntityType = MyRealityFoundation::Entity
#endif
    
    typealias Coordinator = Void
    
    let baseEntity: MyRealityFoundation::Entity // 0x0
    let updateCallback: @MainActor (inout RealityViewContent) -> () // 0x8
    let proxy: GeometryProxy3D // 0x18
    private(set) var model: _RealityViewModel // 0x1c (field)
    let controller: AttachmentStateControllerBase? // 0x20 (field)
    
    func makeEntity(context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) -> EntityType {
        if let controller {
            controller.initialize(with: context)
        }
        
#if RealityKitCompatibility
        return unsafe unsafeBitCast(self.baseEntity.coreEntity, to: CoreRE::Entity.self)
            .realityKitRef
#else
        return self.baseEntity
#endif
    }
    
    func updateEntity(_ entity: EntityType, context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) {
        let model = self.model
        
        switch model.loadingPhase {
        case .empty, .loading:
            return
        case .loaded, .connected:
            break
        }
        
        let transaction = context.transaction
        model.content.transaction = transaction
        
        self.updateCallback(&model.content)
        
        let debugOptions = model.content.debugOptions
        let scene = self.baseEntity.scene
        
        if debugOptions.contains(.showPhysics) {
            // <+308>
            if let scene {
                let coreScene = unsafe unsafeBitCast(scene.coreScene, to: CoreRE::Scene.self)
                coreScene.physicsDebugDrawLevel = .unknown1
            }
        } else {
            if let scene {
                let coreScene = unsafe unsafeBitCast(scene.coreScene, to: CoreRE::Scene.self)
                coreScene.removePhysicsDebugComponent()
            }
        }
        
        model.content.transaction = nil
    }
    
    func _sizeThatFits(in size: _ProposedSize3D, entity: EntityType) -> Size3D {
        return self.proxy.size
    }
}
