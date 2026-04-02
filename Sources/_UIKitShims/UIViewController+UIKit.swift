internal import UIKit
private import ObjectiveC.runtime
private import _MySwiftUIShims

extension UIViewController {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    func msui_setNeedsStatusBarAppearanceUpdate() {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> Void).self)
        let cmd = Selector(("setNeedsStatusBarAppearanceUpdate"))
        casted(self, cmd)
    }
}
