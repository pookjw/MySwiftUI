internal import UIKit
internal import MySwiftUICore

extension UIUserInterfaceStyle {
    init(_colorScheme: ColorScheme?) {
        guard let scheme = _colorScheme else {
            self = .unspecified
            return
        }
        
        switch scheme {
        case .light:
            self = .light
        case .dark:
            self = .dark
        }
    }
}
