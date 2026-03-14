internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import _UIKitPrivate

@MainActor
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
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        let host = host!
        
        guard host.shouldCreateUIInteractions else {
            return
        }
        
        updateDragInteraction(preferenceValues[HasDragItemsKey.self], preferenceValues[DragItemTimings.Key.self])
        updateDropInteraction(preferenceValues[CanDropKey.self])
        updateSpringLoadedInteraction(preferenceValues[CanSpringLoadKey.self])
    }
    
    private func updateDragInteraction(_ hasDragItemsValue: PreferenceValues.Value<Bool>, _ dragItemTimingsValue: PreferenceValues.Value<DragItemTimings>) {
        /*
         hasDragItemsValue = x26 / x29 - 0x60 - 0x100
         dragItemTimingsValue = x28 / x29 - 0x70 - 0x100
         */
        let host = host!
        
        // x24 / x29 - 0x58 - 0x100
        guard let uiView = host.uiView else {
            return
        }
        
        if !hasDragItemsValue.seed.matches(hasDragItemsSeed) {
            if let dragInteraction {
                // <+392>
                // dragInteraction = x28
                if !hasDragItemsValue.value {
                    uiView.removeInteraction(dragInteraction)
                    self.dragInteraction = nil
                }
                // <+588>
            } else {
                // <+464>
                if hasDragItemsValue.value {
                    // <+496>
                    let dragInteraction = UIDragInteraction(delegate: self)
                    dragInteraction.isEnabled = true
                    uiView.myswiftui_addManagedInteraction(dragInteraction)
                    self.dragInteraction = dragInteraction
                    // <+588>
                } else {
                    // <+392>
                    // nop - dragInteraction 없음
                    // <+588>
                }
            }
            
            // <+588>
            self.hasDragItemsSeed = hasDragItemsValue.seed
        }
        
        // <+668>
        if let dragInteraction {
            if !dragItemTimingsValue.seed.matches(self.dragTimingsSeed) {
                // <+872>
                dragItemTimingsValue.value.apply(to: dragInteraction)
                self.dragTimingsSeed = dragItemTimingsValue.seed
            }
        }
    }
    
    private func updateDropInteraction(_ canDropValue: PreferenceValues.Value<Bool>) {
        guard !canDropValue.seed.matches(self.canDropSeed) else {
            return
        }
        
        let host = host!
        
        // x25
        guard let uiView = host.uiView else {
            return
        }
        
        if let dropInteraction {
            // <+348>
            if canDropValue.value {
                // <+512>
                // nop
            } else {
                // <+384>
                uiView.removeInteraction(dropInteraction)
                self.dropInteraction = nil
                // <+516>
            }
        } else {
            // <+420>
            if canDropValue.value {
                // <+448>
                let dropInteraction = UIDropInteraction(delegate: self)
                uiView.myswiftui_addManagedInteraction(dropInteraction)
                // <+516>
            } else {
                // <+616>
                // <+348>
                // nop - dropInteraction 없음
                // <+512>
            }
        }
        
        self.canDropSeed = canDropValue.seed
    }
    
    private func updateSpringLoadedInteraction(_ canSpringLoadValue: PreferenceValues.Value<Bool>) {
        guard !canSpringLoadValue.seed.matches(self.canSpringLoadSeed) else {
            return
        }
        
        let host = host!
        
        // x25
        guard let uiView = host.uiView else {
            return
        }
        
        if let springLoadedInteraction {
            // <+356>
            if canSpringLoadValue.value {
                // nop
                // <+956>
            } else {
                // <+384>
                uiView.removeInteraction(springLoadedInteraction)
                self.springLoadedInteraction = nil
                // <+956>
            }
        } else {
            // <+420>
            if canSpringLoadValue.value {
                // x29, #-0xd8
                let behavior = DragAndDropBridge.SpringLoadedBehavior(bridge: self)
                // x29, #-0xe0
                let effect = DragAndDropBridge.SpringLoadedEffect(bridge: self)
                
                let springLoadedInteraction = UISpringLoadedInteraction(interactionBehavior: behavior, interactionEffect: effect) { interaction, context in
                    // partial apply forwarder for closure #1 (__C.UISpringLoadedInteraction, __C.UISpringLoadedInteractionContext) -> () in SwiftUI.DragAndDropBridge.updateSpringLoadedInteraction(SwiftUI.PreferenceValues.Value<Swift.Bool>) -> ()
                    fatalError("TODO")
                }
                
                uiView.myswiftui_addManagedInteraction(springLoadedInteraction)
                self.springLoadedInteraction = springLoadedInteraction
                // <+960>
            } else {
                // <+1060>
                // <+352>
                // nop - dropInteraction 없음
                // <+956>
            }
        }
        
        self.canSpringLoadSeed = canSpringLoadValue.seed
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

extension DragAndDropBridge {
    @MainActor
    final class SpringLoadedBehavior: NSObject, UISpringLoadedInteractionBehavior {
        private weak var bridge: DragAndDropBridge? = nil
        private let base: any UISpringLoadedInteractionBehavior = UISpringLoadedInteraction._defaultInteractionBehavior()
        
        init(bridge: DragAndDropBridge) {
            self.bridge = bridge
            super.init()
        }
        
        func interactionDidFinish(_ interaction: UISpringLoadedInteraction) {
            fatalError("TODO")
        }
        
        func shouldAllow(_ interaction: UISpringLoadedInteraction, with context: any UISpringLoadedInteractionContext) -> Bool {
            fatalError("TODO")
        }
    }
    
    @MainActor
    final class SpringLoadedEffect: NSObject, UISpringLoadedInteractionEffect {
        private weak var bridge: DragAndDropBridge? = nil
        private var blinkTimer: Timer? = nil
        private var previousHighlightState: SpringLoadingBehavior.HighlightState = .none
        
        init(bridge: DragAndDropBridge) {
            self.bridge = bridge
            super.init()
        }
        
        func interaction(_ interaction: UISpringLoadedInteraction, didChangeWith context: any UISpringLoadedInteractionContext) {
            fatalError("TODO")
        }
    }
}
