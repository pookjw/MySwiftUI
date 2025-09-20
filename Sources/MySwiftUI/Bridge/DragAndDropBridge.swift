#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import _UIKitPrivate

final class DragAndDropBridge: AnyDragAndDropBridge {
    weak var host: (any ViewRendererHost)? = nil
    private var hasDragItemsSeed: VersionSeed = .empty
    private var dragTimingsSeed: VersionSeed = .empty
    private var dragInteraction: UIDragInteraction? = nil
    private var canDropSeed: VersionSeed = .empty
    private var dropInteraction: UIDropInteraction? = nil
    private var canSpringLoadSeed: VersionSeed = .empty
    private var springLoadedInteraction: UISpringLoadedInteraction? = nil
    private var activeSpringLoadedResponder: SpringLoadedViewResponder? = nil
    private var activeDrop: DropDestination? = DropDestination()
    private var onSessionBegan: (() -> Void)? = nil
    private var onSessionEnded: (() -> Void)? = nil
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        if self.host!.shouldCreateUIInteractions {
            viewGraph.addPreference(HasDragItemsKey.self)
            viewGraph.addPreference(DragItemTimings.Key.self)
            viewGraph.addPreference(CanDropKey.self)
            viewGraph.addPreference(CanSpringLoadKey.self)
        }
        
        viewGraph.addPreference(OutlineRootConfiguration.Key.self)
    }
    
    final func preferencesDidChange(_: PreferenceValues) {
        let host = host!
        
        guard host.shouldCreateUIInteractions else {
            fatalError("TODO")
            return
        }
        
        fatalError("TODO")
    }
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
