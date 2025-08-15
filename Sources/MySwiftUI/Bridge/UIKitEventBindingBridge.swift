#warning("TODO")
@_spi(Internal) internal import MySwiftUICore

class UIKitEventBindingBridge: EventBindingBridge {
    var gestureRecognizer: UIKitGestureRecognizer?
    var hoverGestureRecognizer: UIKitHoverGestureRecognizer
    var keyPressResponder: UIKitKeyPressResponder?
    
    init(eventBindingManager: EventBindingManager) {
        fatalError()
    }
}
