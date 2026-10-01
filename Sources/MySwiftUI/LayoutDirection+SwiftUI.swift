internal import UIKit
internal import MySwiftUICore

extension LayoutDirection {
    init?(_ direction: UITraitEnvironmentLayoutDirection) {
        switch direction {
        case .unspecified:
            return nil
        case .leftToRight:
            self = .leftToRight
        case .rightToLeft:
            self = .rightToLeft
        @unknown default:
            return nil
        }
    }
}
