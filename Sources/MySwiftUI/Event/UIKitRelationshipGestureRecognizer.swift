#warning("TODO")
internal import UIKit

class UIKitRelationshipGestureRecognizer: UIGestureRecognizer {
    private var gesturesRequiringFailure: Set<UIGestureRecognizer> = []
    
    override init(target: Any?, action: Selector?) {
        let gesturesRequiringFailure: Set<UIGestureRecognizer>
        if let target {
            fatalError("TODO")
        } else {
            gesturesRequiringFailure = []
        }
        self.gesturesRequiringFailure = gesturesRequiringFailure
        
        super.init(target: target, action: action)
    }
}
