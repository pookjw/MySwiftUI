#warning("TODO")

internal import UIKit
@_spi(Internal) internal import MySwiftUICore

class UIKitHoverGestureRecognizer: UIHoverGestureRecognizer {
    weak var eventBridge: EventBindingBridge?
}
