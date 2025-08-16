#warning("TODO")
internal import UIKit
internal import MySwiftUICore
internal import _UIKitPrivate

class DragAndDropBridge: AnyDragAndDropBridge {
    weak var host: (any ViewRendererHost)? = nil
    var hasDragItemsSeed: VersionSeed = .empty
    var dragTimingsSeed: VersionSeed = .empty
    var dragInteraction: UIDragInteraction? = nil
    var canDropSeed: VersionSeed = .empty
    var dropInteraction: UIDropInteraction? = nil
    var canSpringLoadSeed: VersionSeed = .empty
    var springLoadedInteraction: UISpringLoadedInteraction? = nil
    var activeSpringLoadedResponder: SpringLoadedViewResponder? = nil
    var activeDrop: DropDestination? = DropDestination()
    var onSessionBegan: (() -> Void)? = nil
    var onSessionEnded: (() -> Void)? = nil
}

extension DragAndDropBridge: UIDragInteractionDelegate {
    @objc(_dragInteraction:sessionPropertiesForSession:) func _dragInteraction(_ interaction: UIDragInteraction, sessionPropertiesForSession session: any UIDragSession) -> _UIDragSessionProperties {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, item: UIDragItem, willAnimateCancelWith animator: any UIDragAnimating) {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForAddingTo session: any UIDragSession, withTouchAt point: CGPoint) -> [UIDragItem] {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: any UIDragSession) -> [UIDragItem] {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, prefersFullSizePreviewsFor session: any UIDragSession) -> Bool {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, previewForCancelling item: UIDragItem, withDefault defaultPreview: UITargetedDragPreview) -> UITargetedDragPreview? {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, previewForLifting item: UIDragItem, session: any UIDragSession) -> UITargetedDragPreview? {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, session: any UIDragSession, didEndWith operation: UIDropOperation) {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, sessionWillBegin session: any UIDragSession) {
        fatalError("TODO")
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, willAnimateLiftWith animator: any UIDragAnimating, session: any UIDragSession) {
        fatalError("TODO")
    }
}

extension DragAndDropBridge: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidExit session: any UIDropSession) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, concludeDrop session: any UIDropSession) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, item: UIDragItem, willAnimateDropWith animator: any UIDragAnimating) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: any UIDropSession) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, previewForDropping item: UIDragItem, withDefault defaultPreview: UITargetedDragPreview) -> UITargetedDragPreview? {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnd session: any UIDropSession) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnter session: any UIDropSession) {
        fatalError("TODO")
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: any UIDropSession) -> UIDropProposal {
        fatalError("TODO")
    }
}
