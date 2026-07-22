private import MyRealityFoundation
@_spi(Reality) @_spi(Internal) internal import MySwiftUI
internal import Spatial

struct EntityWrapper : EntityRepresentable {
    typealias EntityType = Entity
    typealias Coordinator = Void
    
    let baseEntity: Entity
    let updateCallback: @MainActor (inout RealityViewContent) -> ()
    let proxy: GeometryProxy3D
    private(set) var model: _RealityViewModel
    let controller: AttachmentStateControllerBase?
    
    func makeEntity(context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) -> MyRealityFoundation.Entity {
        assertUnimplemented()
    }
    
    func updateEntity(_ type: MyRealityFoundation.Entity, context: MySwiftUI.EntityRepresentableContext<EntityWrapper>) {
        assertUnimplemented()
    }
    
    func _sizeThatFits(in size: _ProposedSize3D, entity: Entity) -> Size3D {
        assertUnimplemented()
    }
}
