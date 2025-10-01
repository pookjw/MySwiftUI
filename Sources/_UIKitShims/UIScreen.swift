package import UIKit
private import ObjectiveC.runtime

fileprivate nonisolated(unsafe) let UIScreenClass = objc_getClass("UIScreen") as! AnyClass

package struct MyUIScreen {
    private let screen: AnyObject
    
    package static var main: MyUIScreen {
        let cmd = Selector(("mainScreen"))
        let method = class_getClassMethod(UIScreenClass, cmd)!
        let impl = method_getImplementation(method)
        let casted = unsafeBitCast(impl, to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        return MyUIScreen(screen: casted(UIScreenClass, cmd))
    }
    
    private init(screen: AnyObject) {
        self.screen = screen
    }
    
    package var _referenceBounds: CGRect {
        let cmd = Selector(("_referenceBounds"))
        let method = class_getInstanceMethod(UIScreenClass, cmd)!
        let impl = method_getImplementation(method)
        let casted = unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> CGRect).self)
        return casted(screen, cmd)
    }
    
    package var _pointsPerInch: CGFloat {
        let cmd = Selector(("_pointsPerInch"))
        let method = class_getInstanceMethod(UIScreenClass, cmd)!
        let impl = method_getImplementation(method)
        let casted = unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> CGFloat).self)
        return casted(screen, cmd)
    }
}
