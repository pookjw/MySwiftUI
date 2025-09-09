internal import _UIKitShims
internal import UIKit
private import _UIKitPrivate

extension UICoreViewControllerProvider {
    @MainActor
    var containingViewController: UIViewController? {
        if let coreUIViewController {
            return coreUIViewController
        }
        
        if let view = self as? UIView {
            return view._viewControllerForAncestor()
        }
        
        return nil
    }
}
