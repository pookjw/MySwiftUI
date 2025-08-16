#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class EditMenuBridge: NSObject {
    weak var host: ViewRendererHost? = nil
    weak var listCell: ListCollectionViewCell? = nil
    var interaction: UIEditMenuInteraction? = nil
    var editMenuPresentationSeed: VersionSeed = .empty
    var lastEditMenuPresentation: EditMenuPresentation? = nil
    var presentedMenu: ActiveEditMenu? = nil
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
