package import UIKit
private import ObjectiveC.runtime
private import ObjectiveC.message
private import _MySwiftUIShims

fileprivate let UIScreenClass: AnyClass = unsafe objc_getClass("UIScreen") as! AnyClass

package struct MyUIScreen {
    private let screen: AnyObject
    
    package static var main: MyUIScreen {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        let cmd = Selector(("mainScreen"))
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
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> CGRect).self)
        let cmd = Selector(("_referenceBounds"))
        return casted(screen, cmd)
    }
    
    package var _pointsPerInch: CGFloat {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> CGFloat).self)
        let cmd = Selector(("_pointsPerInch"))
        return casted(screen, cmd)
    }
    
    package var scale: CGFloat {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> CGFloat).self)
        let cmd = #selector(NSDecimalNumberBehaviors.scale)
        return casted(screen, cmd)
    }
}

extension UIWindow {
    package var myUIScreen: MyUIScreen? {
        let casted = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector) -> AnyObject?).self)
        let cmd = Selector(("screen"))
        
        guard let screen = casted(self, cmd) else {
            return nil
        }
        
        return MyUIScreen(screen: screen)
    }
}
