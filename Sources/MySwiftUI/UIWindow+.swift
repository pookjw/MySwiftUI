internal import UIKit
internal import MySwiftUICore

extension UIWindow {
    func applyAccessibilityProperties(from properties: AccessibilityProperties?) {
        guard properties != nil else {
            self.accessibilityIdentifier = nil
            return
        }
        
        assertUnimplemented()
    }
}
