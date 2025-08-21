#warning("TODO")

@_spi(Internal) public import MySwiftUICore
public import UIKit

class UIViewPlatformViewDefinition: PlatformViewDefinition {
    
}

extension UIView {
    @_spi(Internal) open override class func _mySwiftUI_platformViewDefinition() -> UnsafeRawPointer {
        return unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
    }
}
