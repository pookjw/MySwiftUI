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
    private var presentedMenu: ActiveContextMenu = ActiveContextMenu()
    
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
    
    func preferencesDidChange(_: PreferenceValues) {
        fatalError("TODO")
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
