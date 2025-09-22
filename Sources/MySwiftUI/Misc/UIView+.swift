internal import UIKit

extension UIView {
    @objc(mySwiftui_addManagedInteraction:) func addManagedInteraction(_ interaction: any UIInteraction) {
        addInteraction(interaction)
    }
}
