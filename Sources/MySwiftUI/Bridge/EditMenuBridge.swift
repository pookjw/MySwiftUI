#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

final class EditMenuBridge: NSObject {
    weak var host: ViewRendererHost? = nil
    private weak var listCell: ListCollectionViewCell? = nil
    private var interaction: UIEditMenuInteraction? = nil
    private var editMenuPresentationSeed: VersionSeed = .empty
    private var lastEditMenuPresentation: EditMenuPresentation? = nil
    private var presentedMenu: ActiveEditMenu? = nil
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(EditMenuPresentation.Key.self)
        viewGraph.addPreference(HasEditMenuKey.self)
    }
    
    // 원래 없음
    @inlinable
    @MainActor
    func hostRemovedFromWindow() {
        UIView.performWithoutAnimation {
            self.interaction?.dismissMenu()
        }
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        let preferenceValue = preferenceValues[EditMenuPresentation.Key.self]
        
        guard !preferenceValue.seed.matches(editMenuPresentationSeed) else {
            return
        }
        
        fatalError("TODO")
    }
}

extension EditMenuBridge: UIEditMenuInteractionDelegate {
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration, suggestedActions: [UIMenuElement]) -> UIMenu? {
        fatalError("TODO")
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, targetRectFor configuration: UIEditMenuConfiguration) -> CGRect {
        fatalError("TODO")
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, willDismissMenuFor configuration: UIEditMenuConfiguration, animator: any UIEditMenuInteractionAnimating) {
        fatalError("TODO")
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, willPresentMenuFor configuration: UIEditMenuConfiguration, animator: any UIEditMenuInteractionAnimating) {
        fatalError("TODO")
    }
}
