internal import UIKit

extension UIViewController {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    func msui_setNeedsStatusBarAppearanceUpdate() {
        (self as AnyObject).setNeedsStatusBarAppearanceUpdate()
    }
}

fileprivate final class PrivateSelectors {
    @objc(setNeedsStatusBarAppearanceUpdate) func setNeedsStatusBarAppearanceUpdate() {
        fatalError()
    }
}
