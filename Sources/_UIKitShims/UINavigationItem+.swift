package import UIKit
private import ObjectiveC.runtime

extension UINavigationItem {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
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
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    package var msui_subtitle: String? {
        get {
            let cmd = Selector(("subtitle"))
            let method = unsafe class_getInstanceMethod(UINavigationItem.self, cmd)!
            let impl = unsafe method_getImplementation(method)
            let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> NSString?).self)
            return casted(self, cmd) as String?
        }
        set {
            let cmd = Selector(("setSubtitle:"))
            let method = unsafe class_getInstanceMethod(UINavigationItem.self, cmd)!
            let impl = unsafe method_getImplementation(method)
            let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector, NSString?) -> Void).self)
            casted(self, cmd, newValue as NSString?)
        }
    }
}
