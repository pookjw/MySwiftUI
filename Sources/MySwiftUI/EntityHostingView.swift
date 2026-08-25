internal import UIKit
internal import RealityKit
private import CoreRE
private import AttributeGraph

final class EntityHostingView<T : RealityKit::Entity> : UIView {
    private var contentEntity: T
    
    init(contentEntity: T, hostingComponent: AttachmentHostingComponent?) {
        assertUnimplemented()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(entity: T, hostingComponent: AttachmentHostingComponent?) {
        assertUnimplemented()
    }
}
