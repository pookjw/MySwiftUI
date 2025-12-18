package import UIKit
private import ObjectiveC.runtime

fileprivate let UIScreenClass: AnyClass = unsafe objc_getClass("UIScreen") as! AnyClass

package struct MyUIScreen {
    private let screen: AnyObject
    
    package static var main: MyUIScreen {
        let cmd = Selector(("mainScreen"))
        let method = unsafe class_getClassMethod(UIScreenClass, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        return MyUIScreen(screen: casted(UIScreenClass, cmd))
    }
    
    package static var _mainScreen: MyUIScreen {
        // (Direct) +[UIScreen _mainScreen]
        return .main
    }
    
    fileprivate init(screen: AnyObject) {
        self.screen = screen
    }
    
    package var _referenceBounds: CGRect {
        let cmd = Selector(("_referenceBounds"))
        let method = unsafe class_getInstanceMethod(UIScreenClass, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> CGRect).self)
        return casted(screen, cmd)
    }
    
    package var _pointsPerInch: CGFloat {
        let cmd = Selector(("_pointsPerInch"))
        let method = unsafe class_getInstanceMethod(UIScreenClass, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> CGFloat).self)
        return casted(screen, cmd)
    }
    
    package var scale: CGFloat {
        let cmd = #selector(NSDecimalNumberBehaviors.scale)
        let method = unsafe class_getInstanceMethod(UIScreenClass, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> CGFloat).self)
        return casted(screen, cmd)
    }
}

extension UIWindow {
    package var myUIScreen: MyUIScreen? {
        let cmd = Selector(("screen"))
        let method = unsafe class_getInstanceMethod(object_getClass(self)!, cmd)!
        let impl = unsafe method_getImplementation(method)
        let casted = unsafe unsafeBitCast(impl, to: (@convention(c) (AnyObject, Selector) -> AnyObject?).self)
        
        guard let screen = casted(self, cmd) else {
            return nil
        }
        
        return MyUIScreen(screen: screen)
    }
}
