#warning("TODO")

internal import UIKit
@_spi(Internal) internal import MySwiftUICore

// TODO: final인지 검증
class UIKitHoverGestureRecognizer: UIHoverGestureRecognizer {
    weak var eventBridge: EventBindingBridge?
}
