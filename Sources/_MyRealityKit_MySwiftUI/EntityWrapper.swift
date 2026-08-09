private import MyRealityFoundation
@_spi(Internal) internal import MySwiftUI
internal import Spatial
#if RealityKitCompataibility
internal import RealityKit
private import CoreRE
#endif

struct EntityWrapper : EntityRepresentable {
#if RealityKitCompataibility
    typealias EntityType = RealityKit::Entity
#else
    typealias EntityType = MyRealityFoundation::Entity
#endif
    
    typealias Coordinator = Void
    
    let baseEntity: MyRealityFoundation::Entity // 0x0
    let updateCallback: @MainActor (inout RealityViewContent) -> () // 0x8
    let proxy: GeometryProxy3D // 0x18
    private(set) var model: _RealityViewModel // 0x60
    let controller: AttachmentStateControllerBase? // 0x20 (field)
    
    func makeEntity(context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) -> EntityType {
        if let controller {
            controller.initialize(with: context)
        }
        
#if RealityKitCompataibility
        return unsafe unsafeBitCast(self.baseEntity.coreEntity, to: CoreRE::Entity.self)
            .realityKitRef
#else
        return self.baseEntity
#endif
    }
    
    func updateEntity(_ entity: EntityType, context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) {
        assertUnimplemented()
    }
    
    func _sizeThatFits(in size: _ProposedSize3D, entity: EntityType) -> Size3D {
        assertUnimplemented()
    }
}
