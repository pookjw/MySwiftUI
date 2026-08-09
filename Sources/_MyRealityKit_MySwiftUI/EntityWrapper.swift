private import MyRealityFoundation
@_spi(Internal) internal import MySwiftUI
internal import Spatial
#if RealityKitCompataibility
internal import RealityKit
#endif

struct EntityWrapper : EntityRepresentable {
#if RealityKitCompataibility
    typealias EntityType = RealityKit::Entity
#else
    typealias EntityType = MyRealityFoundation::Entity
#endif
    
    typealias Coordinator = Void
    
    let baseEntity: MyRealityFoundation::Entity
    let updateCallback: @MainActor (inout RealityViewContent) -> ()
    let proxy: GeometryProxy3D
    private(set) var model: _RealityViewModel
    let controller: AttachmentStateControllerBase?
    
    func makeEntity(context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) -> EntityType {
        assertUnimplemented()
    }
    
    func updateEntity(_ entity: EntityType, context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) {
        assertUnimplemented()
    }
    
    func _sizeThatFits(in size: _ProposedSize3D, entity: EntityType) -> Size3D {
        assertUnimplemented()
    }
}
