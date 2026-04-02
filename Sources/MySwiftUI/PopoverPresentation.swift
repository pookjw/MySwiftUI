internal import UIKit
internal import MySwiftUICore

struct PopoverPresentation {
    // TODO
}

extension PopoverPresentation {
    struct Key : HostPreferenceKey {
        static var defaultValue: [PopoverPresentation] {
            return []
        }
        
        static func reduce(value: inout [PopoverPresentation], nextValue: () -> [PopoverPresentation]) {
            assertUnimplemented()
        }
    }
}

// TODO: final인지 검증
class PopoverPresentationDelegate : NSObject {
    private weak var delegate: PopoverPresentationDelegateDelegate?
    private var isLayoutPreventionActive: Bool
    
    override init() {
        assertUnimplemented()
    }
}

extension PopoverPresentationDelegate : UIPopoverPresentationControllerDelegate {
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
        assertUnimplemented()
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        assertUnimplemented()
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        assertUnimplemented()
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        assertUnimplemented()
    }
}

protocol PopoverPresentationDelegateDelegate : AnyObject {
    // TODO
}
