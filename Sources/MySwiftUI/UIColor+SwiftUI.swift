public import _MySwiftUICoreShims
public import UIKit

extension UIColor {
    @_spi(Internal) open override class func _mySwiftUI_platformColorDefinition() -> AnyClass? {
        return UIKitPlatformColorDefinition.self
    }
}
