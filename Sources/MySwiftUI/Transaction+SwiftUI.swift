internal import MySwiftUICore
private import UIKit
private import _UIKitPrivate
private import _MySwiftUICoreShims
private import _QuartzCorePrivate

extension Transaction {
    @MainActor static func currentUIViewTransaction(canDisableAnimations: Bool) -> Transaction? {
        if canDisableAnimations, !UIView.areAnimationsEnabled {
            var transaction = Transaction()
            transaction.disablesAnimations = true
            return transaction
        }
        
        guard UIView._isInAnimationBlockWithAnimationsEnabled() else {
            return nil
        }
        
        let duration = UIView._currentAnimationDuration()
        let curve = UIView._currentAnimationCurve().rawValue
        guard let animation = Animation.uiViewAnimation(curve: curve, duration: duration) else {
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
