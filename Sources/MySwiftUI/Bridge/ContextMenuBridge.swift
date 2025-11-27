#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import _UIKitPrivate

final class ContextMenuBridge: NSObject {
    weak var host: (any ViewRendererHost)? = nil
    private var interaction: UIContextMenuInteraction? = nil
    private var menuOrder: MenuOrder = .automatic
    private var hasContextMenuSeed: VersionSeed = .empty
    private var menuOrderSeed: VersionSeed = .empty
    private var inspectorBridgeToken: UncheckedSendable<NSObject>? = nil
    private var lastPresentationValues: [ViewIdentity : ContextMenuPresentation] = [:]
    private var presentationSeed: VersionSeed = .empty
    private(set) var presentedMenu = ActiveContextMenu()
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        guard host!.shouldCreateUIInteractions else {
            return
        }
        
        viewGraph.addPreference(HasContextMenuKey.self)
        viewGraph.addPreference(MenuOrderPreferenceKey.self)
        viewGraph.addPreference(ContextMenuPresentation.Key.self)
    }
    
    // 원래 없음
    @inlinable
    @MainActor
    func hostRemovedFromWindow() {
        if let interaction {
            UIView.performWithoutAnimation {
                interaction.dismissMenu()
            }
        }
    }
    
    @MainActor
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        // defer 있음
        guard host!.shouldCreateUIInteractions else {
            return
        }
        
        guard let uiView = host!.uiView else {
            return
        }
        
        // x21 / x29, #-0xe8
        let hasContextMenuValue = preferenceValues[HasContextMenuKey.self]
        // x26 / x29, #-0xf0
        let menuOrderPreferenceValue = preferenceValues[MenuOrderPreferenceKey.self]
        
        let currentHasContextMenuSeed = hasContextMenuSeed
        let newHasContextMenuSeed = hasContextMenuValue.seed
        self.hasContextMenuSeed = newHasContextMenuSeed
        if newHasContextMenuSeed.matches(currentHasContextMenuSeed) {
            let currentMenuOrderSeed = menuOrderSeed
            let newMenuOrderSeed = menuOrderPreferenceValue.seed
            self.menuOrderSeed = newMenuOrderSeed
            if newMenuOrderSeed.matches(currentMenuOrderSeed) {
                return
            }
        }
        
        // <+956>
        // x24
        let contextMenuPresentationValue = preferenceValues[ContextMenuPresentation.Key.self]
        
        let currentPresentationSeed = presentationSeed
        let newPresentationSeed = contextMenuPresentationValue.seed
        self.presentationSeed = newPresentationSeed
        if newPresentationSeed.matches(currentPresentationSeed) {
            return
        }
        
        // <+1148>
        if let interaction {
            // <+1180>
            if hasContextMenuValue.value {
                // <+1356>
                // nop
            } else {
                // <+1212>
                interaction.dismissMenu()
                uiView.removeInteraction(interaction)
                self.interaction = nil
                // <+1356>
            }
        } else {
            // <+1264>
            if hasContextMenuValue.value {
                // <+1292>
                let interaction = UIContextMenuInteraction(delegate: self)
                uiView.myswiftui_addManagedInteraction(interaction)
                self.interaction = interaction
            } else {
                // <+1824>
                // nop - interaction 없음
                // <+1360>
            }
        }
        
        // <+1356>
        defer {
            self.hasContextMenuSeed = hasContextMenuValue.seed
            self.presentationSeed = contextMenuPresentationValue.seed
            self.lastPresentationValues = contextMenuPresentationValue.value
            self.menuOrderSeed = menuOrderPreferenceValue.seed
        }
        
        self.menuOrder = menuOrderPreferenceValue.value
        
        let presentedMenu = presentedMenu
        
        guard presentedMenu.id != .invalid else {
            return
        }
        
        if
            let presentation = contextMenuPresentationValue.value[presentedMenu.id],
            !presentation.isPresented.wrappedValue,
            let interaction
        {
            interaction.dismissMenu()
        }
    }
}

extension ContextMenuBridge: _UIContextMenuInteractionDelegate3D {
    func _contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation3D location3D: CAPoint3D) -> UIContextMenuConfiguration? {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForDismissingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willDisplayMenuFor configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        fatalError("TODO")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating) {
        fatalError("TODO")
    }
}
