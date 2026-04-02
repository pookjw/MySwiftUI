internal import UIKit
internal import MySwiftUICore

final class SheetTransitioningDelegate : NSObject {
    weak var host: ViewRendererHost? = nil
    private var sourceRect: Anchor<CGRect>? = nil
}

extension SheetTransitioningDelegate : UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        assertUnimplemented()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        assertUnimplemented()
    }
}
