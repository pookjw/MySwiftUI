// 278B8B6E01D480C09D89EEF65D03A530
internal import UIKit
internal import RealityKit
private import CoreRE
private import AttributeGraph
private import _UIKitPrivate

final class EntityHostingView<T : RealityKit::Entity> : UIView {
    private var contentEntity: T
    
    init(contentEntity: T, hostingComponent: AttachmentHostingComponent?) {
        self.contentEntity = contentEntity
        super.init(frame: .zero)
        self._request(.tracked, withReason: .entityLeafView)
        
        if let reEntity = self._reEntity {
            unsafe unsafeBitCast(reEntity, to: OpaquePointer.self).name = "EntityViewFactory"
        }
        
        // <+444>
        unsafe unsafeBitCast(contentEntity.coreEntity, to: CoreRE::Entity.self).parent = self._reEntity
        
        guard
            let reEntity = self._reEntity,
            let hostingComponent
        else {
            return
        }
        
        // <+504>
        let ref = RealityKit::__EntityRef.__fromCore(reEntity)
        let entity = RealityKit::Entity.__fromCore(ref)
        entity.components.set(hostingComponent)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(entity: T, hostingComponent: AttachmentHostingComponent?) {
        assertUnimplemented()
    }
}

extension _UIViewSeparatedStateRequestReason {
    fileprivate static let entityLeafView = _UIViewSeparatedStateRequestReason(rawValue: "SwiftUI.EntityLeafView")
}
