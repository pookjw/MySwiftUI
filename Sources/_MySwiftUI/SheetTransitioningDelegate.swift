internal import UIKit
internal import MySwiftUICore

final class SheetTransitioningDelegate: NSObject {
    weak var host: ViewRendererHost? = nil
    private var sourceRect: Anchor<CGRect>? = nil
}

extension SheetTransitioningDelegate: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        fatalError("TODO")
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        fatalError("TODO")
    }
}
