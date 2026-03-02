internal import MySwiftUICore
internal import UIKit

extension UIAccessibilityContrast {
    init(_colorSchemeContrast contrast: ColorSchemeContrast?) {
        guard let contrast else {
            self = .unspecified
            return
        }
        
        switch contrast {
        case .standard:
            self = .normal
        case .increased:
            self = .high
        @unknown default:
            self = .unspecified
        }
    }
}
