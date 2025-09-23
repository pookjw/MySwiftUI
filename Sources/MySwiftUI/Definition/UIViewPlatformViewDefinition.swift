#warning("TODO")

@_spi(Internal) internal import MySwiftUICore
public import UIKit

// TODO: final인지 검증
class UIViewPlatformViewDefinition: PlatformViewDefinition {
    override class var system: PlatformViewDefinition.System {
        return .uiView
    }
}

extension UIView {
    @_spi(Internal) open override class func _mySwiftUI_platformViewDefinition() -> UnsafeRawPointer {
        return unsafe unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
    }
}
