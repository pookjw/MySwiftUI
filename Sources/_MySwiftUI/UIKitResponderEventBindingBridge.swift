internal import MySwiftUICore

final class UIKitResponderEventBindingBridge {
    private var gestureRecognizer: UIKitResponderGestureRecognizer
    private var actions: [() -> Void]
    
    init() {
        fatalError("To be removed")
    }
    
//    init(eventBindingManager: EventBindingManager, responder: AnyGestureResponder) {
//        fatalError("TODO")
//    }
}

final class UIKitResponderGestureRecognizer: UIKitGestureRecognizer {
    
}

extension UIKitResponderEventBindingBridge {
    struct Factory: EventBindingBridgeFactory {
        
    }
}
