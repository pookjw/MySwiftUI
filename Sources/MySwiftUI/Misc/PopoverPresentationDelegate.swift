#warning("TODO")
internal import UIKit

class PopoverPresentationDelegate: NSObject {
    private weak var delegate: PopoverPresentationDelegateDelegate?
    private var isLayoutPreventionActive: Bool
    
    override init() {
        fatalError("TODO")
    }
}

extension PopoverPresentationDelegate: UIPopoverPresentationControllerDelegate {
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
        fatalError("TODO")
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        fatalError("TODO")
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        fatalError("TODO")
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        fatalError("TODO")
    }
}

protocol PopoverPresentationDelegateDelegate: AnyObject {
    // TODO
}
