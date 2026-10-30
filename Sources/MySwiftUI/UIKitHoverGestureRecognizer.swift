
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

// TODO: final인지 검증
class UIKitHoverGestureRecognizer : UIHoverGestureRecognizer {
    weak var eventBridge: EventBindingBridge?
    
    @objc func _hoverEntered(_ touches: Set<UITouch>, with event: UIEvent) {
        assertUnimplemented()
    }
    
    @objc func _hoverExited(_ touches: Set<UITouch>, with event: UIEvent) {
        assertUnimplemented()
    }
    
    @objc func _hoverMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        assertUnimplemented()
    }
    
    @objc func _hoverCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        assertUnimplemented()
    }
    
    override func reset() {
        assertUnimplemented()
    }
}
