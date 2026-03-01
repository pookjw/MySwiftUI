package import UIKit
private import ObjectiveC.runtime
private import ObjectiveC.message
private import _MySwiftUIShims

extension UINavigationItem {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    package var msui_searchBarPlacementAllowsExternalIntegration: Bool {
        get {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> ObjCBool).self)
            let cmd = Selector(("searchBarPlacementAllowsExternalIntegration"))
            return casted(self, cmd).boolValue
        }
        set {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector, ObjCBool) -> Void).self)
            let cmd = Selector(("searchBarPlacementAllowsExternalIntegration"))
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
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> NSString?).self)
            let cmd = Selector(("subtitle"))
            return casted(self, cmd) as String?
        }
        set {
            let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector, NSString?) -> Void).self)
            let cmd = Selector(("setSubtitle:"))
            casted(self, cmd, newValue as NSString?)
        }
    }
}
