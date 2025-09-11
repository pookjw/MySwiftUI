#warning("TODO")

internal import UIKit
@_spi(Internal) private import MySwiftUICore

class UIKitKeyPressResponder: UIResponder {
    private weak var eventBindingManager: EventBindingManager? = nil
    private weak var fallbackResponderProvider: FallbackResponderProvider? = nil
    private var tracker = KeyEvent.Tracker()
    
    // 원래 없음
    @inlinable init(eventBindingManager: EventBindingManager?, fallbackResponderProvider: FallbackResponderProvider?) {
        self.eventBindingManager = eventBindingManager
        self.fallbackResponderProvider = fallbackResponderProvider
        super.init()
    }
}
