internal import UIKit
private import ObjectiveC.runtime

extension UIViewController {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    func msui_setNeedsStatusBarAppearanceUpdate() {
        let cmd = Selector(("setNeedsStatusBarAppearanceUpdate"))
        let method = unsafe class_getInstanceMethod(UINavigationItem.self, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> Void).self)
        casted(self, cmd)
    }
}
