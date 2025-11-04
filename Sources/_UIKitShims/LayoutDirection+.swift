internal import MySwiftUICore
internal import UIKit

extension LayoutDirection {
    init?(_uiLayoutDirection direction: UITraitEnvironmentLayoutDirection) {
        switch direction {
        case .leftToRight:
            self = .leftToRight
        case .rightToLeft:
            self = .rightToLeft
        default:
            return nil
        }
    }
}
