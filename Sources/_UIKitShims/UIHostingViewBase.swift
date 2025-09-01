package import UIKit
@_spi(Internal) package import MySwiftUICore

package class UIHostingViewBase: NSObject {
}

extension UIHostingViewBase {
    package struct Configuration {
        package var options = UIHostingViewBase.Options.allowContainerShape
        package var colorDefinitions: PlatformColorDefinition.Type? = nil
        
        package init() {
        }
    }
}

extension UIHostingViewBase {
    package struct Options: OptionSet {
        package static var allowUnregisteredGeometryChanges: Options { return Options(rawValue: 1 << 0) }
        package static var allowKeyboardSafeArea: Options { return Options(rawValue: 1 << 1) }
        package static var allowContainerShape: Options { return Options(rawValue: 0) }
        
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
