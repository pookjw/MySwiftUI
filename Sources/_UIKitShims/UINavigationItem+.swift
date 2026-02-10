package import UIKit
private import ObjectiveC.runtime

extension UINavigationItem {
    package var msui_searchBarPlacementAllowsExternalIntegration: Bool {
        get {
            let cmd = Selector(("searchBarPlacementAllowsExternalIntegration"))
            let method = unsafe class_getInstanceMethod(UINavigationItem.self, cmd)!
            let impl = unsafe method_getImplementation(method)
            let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> ObjCBool).self)
            return casted(self, cmd).boolValue
        }
        set {
            let cmd = Selector(("searchBarPlacementAllowsExternalIntegration"))
            let method = unsafe class_getInstanceMethod(UINavigationItem.self, cmd)!
            let impl = unsafe method_getImplementation(method)
            let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector, ObjCBool) -> Void).self)
            casted(self, cmd, ObjCBool(newValue))
        }
    }
}
