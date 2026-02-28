internal import UIKit
internal import MySwiftUICore

extension ColorScheme {
    init?(_uiUserInterfaceStyle style: UIUserInterfaceStyle) {
        switch style {
        case .light:
            self = .light
        case .dark:
            self = .dark
        default:
            self = .light
        }
    }
}
