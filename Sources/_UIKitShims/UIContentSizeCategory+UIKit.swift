internal import UIKit
internal import MySwiftUICore

extension UIContentSizeCategory {
    init(_dynamicTypeSize: DynamicTypeSize?) {
        guard let size = _dynamicTypeSize else {
            self = .unspecified
            return
        }
        
        switch size {
        case .xSmall:
            self = .extraSmall
        case .small:
            self = .small
        case .medium:
            self = .medium
        case .large:
            self = .large
        case .xLarge:
            self = .extraLarge
        case .xxLarge:
            self = .extraExtraLarge
        case .xxxLarge:
            self = .extraExtraExtraLarge
        case .accessibility1:
            self = .accessibilityMedium
        case .accessibility2:
            self = .accessibilityLarge
        case .accessibility3:
            self = .accessibilityExtraLarge
        case .accessibility4:
            self = .accessibilityExtraExtraLarge
        case .accessibility5:
            self = .accessibilityExtraExtraExtraLarge
        }
    }
}
