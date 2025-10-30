internal import MySwiftUICore
private import UIKit
private import _UIKitPrivate
private import _MySwiftUIShims
private import _QuartzCorePrivate

extension Transaction {
    @MainActor static func currentUIViewTransaction(canDisableAnimations: Bool) -> Transaction? {
        if canDisableAnimations, !UIView.areAnimationsEnabled {
            let transaction = Transaction()
            transaction.disablesAnimations = true
            return transaction
        }
        
        guard UIView._isInAnimationBlockWithAnimationsEnabled() else {
            return nil
        }
        
        guard let animation = Animation.uiViewAnimation(curve: UIView._currentAnimationCurve().rawValue, duration: UIView._currentAnimationDuration()) else {
            return nil
        }
        
        let transaction = Transaction(animation: animation)
        if let completionItem = _CATransactionCompletionItem() {
            transaction.addAnimationListener {
                completionItem.invalidate()
            }
        }
        
        return transaction
    }
}
