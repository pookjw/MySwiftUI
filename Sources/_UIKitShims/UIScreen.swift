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
}
