// BB8F5ECFA8AF74AE8152DD1EB3C8CC7B
internal import _UIKitPrivate
private import CoreRE
internal import RealityKit

final class EntityHostResponder : UIEntityResponder {
    private var entityRepresentable: (any EntityRepresentable)? // 0x38
    
    convenience init?(for entity: OpaquePointer, in representable: any EntityRepresentable) {
        let reEntity = unsafe unsafeBitCast(entity, to: CoreRE::Entity.self)
        self.init(for: reEntity)
        self.entityRepresentable = representable
    }
    
    fileprivate var parentHitTestingView: HitTestingLeafPlatformView? {
        assertUnimplemented()
    }
    
    // TODO: Generic Type
    fileprivate var entityHostingView: EntityHostingView<RealityKit::Entity>? {
        assertUnimplemented()
    }
    
    override func _hitTest(with context: _UIHitTestContext) -> (any UIResponder & _UIGestureRecognizerContainer)? {
        assertUnimplemented()
    }
}
