#warning("TODO")
@_spi(Internal) internal import MySwiftUICore

class UIKitEventBindingBridge: EventBindingBridge {
    private var gestureRecognizer: UIKitGestureRecognizer? = nil
    private var hoverGestureRecognizer: UIKitHoverGestureRecognizer
    private var keyPressResponder: UIKitKeyPressResponder? = nil
    
    @MainActor
    override init(eventBindingManager: EventBindingManager) {
        if !GestureContainerFeature.isEnabled {
            gestureRecognizer = UIKitGestureRecognizer()
        }
        self.hoverGestureRecognizer = UIKitHoverGestureRecognizer()
        
        super.init(eventBindingManager: eventBindingManager)
        
        self.gestureRecognizer?.eventBridge = self
        self.hoverGestureRecognizer.eventBridge = self
    }
}
