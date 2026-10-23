@_spi(Internal) internal import MySwiftUICore
internal import UIKit

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
    override func didAttach(to bridge: EventBindingBridge?) {
        assertUnimplemented()
    }

    override var name: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override func canBePrevented(by preventingGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func canPrevent(_ preventedGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func shouldRequireFailure(of otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func shouldBeRequiredToFail(by otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func isKind(of aClass: AnyClass) -> Bool {
        assertUnimplemented()
    }
}

extension UIKitResponderEventBindingBridge {
    struct Factory : EventBindingBridgeFactory {
        
    }
}
