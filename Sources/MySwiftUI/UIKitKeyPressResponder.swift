
// BBD8610226FE23E138D25B0D9DE9C402
internal import UIKit
@_spi(Internal) private import MySwiftUICore

final class UIKitKeyPressResponder : UIResponder {
    private weak var eventBindingManager: EventBindingManager? = nil
    private weak var fallbackResponderProvider: FallbackResponderProvider? = nil
    private var tracker = KeyEvent.Tracker()
    
    override var next: UIResponder? {
        guard let fallbackResponderProvider else {
            return nil
        }
        
        return fallbackResponderProvider.defaultNextResponder
    }
    
    private func sendPresses(_ presses: Set<UIPress>, phase: EventPhase) -> Bool {
        assertUnimplemented()
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        assertUnimplemented()
    }
    
    override func pressesChanged(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        assertUnimplemented()
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        assertUnimplemented()
    }
    
    override func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        assertUnimplemented()
    }
    
    // 원래 없음
    @inlinable init(eventBindingManager: EventBindingManager?, fallbackResponderProvider: FallbackResponderProvider?) {
        self.eventBindingManager = eventBindingManager
        self.fallbackResponderProvider = fallbackResponderProvider
        super.init()
    }
}
