internal import UIKit
internal import _UIKitPrivate

// TODO: final인지 검증
class PlatformAlertController: UIAlertController {
    var onDismissAction: (() -> Void)? = nil
    var allowsSecureDrawing: Bool = false
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let onDismissAction {
            onDismissAction()
        }
    }
    
    override func _canShowWhileLocked() -> Bool {
        return allowsSecureDrawing
    }
}
