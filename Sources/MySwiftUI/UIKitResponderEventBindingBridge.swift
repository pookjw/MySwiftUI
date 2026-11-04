@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import _UIKitPrivate

@MainActor
final class UIKitResponderEventBindingBridge : EventBindingBridge, GestureGraphDelegate {
    private var gestureRecognizer: UIKitResponderGestureRecognizer
    private var actions: [() -> Void]
    
    override init() {
        fatalError("To be removed")
    }
    
    override init(eventBindingManager: EventBindingManager) {
        fatalError("To be removed")
    }
    
    init(eventBindingManager: EventBindingManager, responder: AnyGestureResponder) {
        self.actions = []
        self.gestureRecognizer = UIKitResponderGestureRecognizer()
        self.gestureRecognizer.responder = responder
        super.init(eventBindingManager: eventBindingManager)
        self.gestureRecognizer.eventBridge = self
        self.gestureRecognizer.addTarget(self, action: #selector(flushActions))
    }
    
    var eventSources: [any EventBindingSource] {
        get {
            assertUnimplemented()
        }
    }
    
    @objc func flushActions() {
        assertUnimplemented()
    }
    
    func reset(eventSource: any EventBindingSource, resetForwardedEventDispatchers: Bool) {
        assertUnimplemented()
    }
    
    nonisolated func enqueueAction(_ action: @MainActor @Sendable () -> Void) {
        assertUnimplemented()
    }
}

final class UIKitResponderGestureRecognizer : UIKitGestureRecognizer {
    weak var responder: AnyGestureResponder?
    fileprivate var isDeterminingDynamicFailureRequirement = false
    
    override init() {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
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
    
    override func _isGestureType(_ gestureType: Int) -> Bool {
        assertUnimplemented()
    }
    
    @objc func numberOfTapsRequired() -> UInt {
        assertUnimplemented()
    }
    
    @objc func numberOfTouchesRequired() -> UInt {
        assertUnimplemented()
    }
    
    @objc func buttonMaskRequired() -> UIEvent.ButtonMask {
        assertUnimplemented()
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
    
    override func _canBeCancelled(by otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func isKind(of aClass: AnyClass) -> Bool {
        assertUnimplemented()
    }
}

extension UIKitResponderEventBindingBridge {
    struct Factory : EventBindingBridgeFactory {
        static func makeEventBindingBridge(bindingManager: EventBindingManager, responder: AnyGestureResponder) -> (any EventBindingBridge & GestureGraphDelegate) {
            assertUnimplemented()
        }
    }
}
