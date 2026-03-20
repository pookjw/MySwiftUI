internal import UIKit
internal import MySwiftUICore

extension UIWindow {
    func applyAccessibilityProperties(from properties: AccessibilityProperties?) {
        guard let properties else {
            self.accessibilityIdentifier = nil
            return
        }
        
        assertUnimplemented()
    }
}
