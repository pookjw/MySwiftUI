internal import UIKit
internal import MySwiftUICore

final class UIKitRelationshipGestureRecognizer : UIGestureRecognizer {
    var gesturesRequiringFailure: Set<UIGestureRecognizer> = []

    override init(target: Any?, action: Selector?) {
        assertUnimplemented()
    }

    override func canBePrevented(by preventingGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }

    override func canPrevent(_ preventedGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
}
