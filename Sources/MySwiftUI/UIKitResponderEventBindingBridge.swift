internal import MySwiftUICore

@MainActor
final class UIKitResponderEventBindingBridge {
    private var gestureRecognizer: UIKitResponderGestureRecognizer
    private var actions: [() -> Void]
    
    init() {
        fatalError("To be removed")
    }
    
//    init(eventBindingManager: EventBindingManager, responder: AnyGestureResponder) {
//        assertUnimplemented()
//    }
}

final class UIKitResponderGestureRecognizer : UIKitGestureRecognizer {
    
}

extension UIKitResponderEventBindingBridge {
    struct Factory : EventBindingBridgeFactory {
        
    }
}
