#warning("TODO")

@_spi(Internal) internal import MySwiftUICore
public import UIKit

class UIViewPlatformViewDefinition: PlatformViewDefinition {
    override class var system: PlatformViewDefinition.System {
        return .uiView
    }
}

extension UIView {
    @_spi(Internal) open override class func _mySwiftUI_platformViewDefinition() -> UnsafeRawPointer {
        return unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
    }
}
