package import UIKit
private import ObjectiveC.runtime
private import ObjectiveC.message
private import _MySwiftUICoreShims
package import MRUIKit

@_fixed_layout
package class MyUIFeedbackGenerator {
    fileprivate class var claassType: AnyClass {
        return unsafe objc_getClass("UIFeedbackGenerator") as! AnyClass
    }
    
    package let feedbackGenerator: AnyObject
    
    package init(view: UIView?) {
        let alloc = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        var ref = alloc(Self.claassType, Selector(("alloc")))
        let initWithView = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector, UIView?) -> AnyObject).self)
        ref = initWithView(ref, Selector(("initWithView:")), view)
        
        self.feedbackGenerator = ref
    }
    
    fileprivate init(feedbackGenerator: AnyObject) {
        self.feedbackGenerator = feedbackGenerator
    }
}

@_fixed_layout
package final class MyMRUIFeedbackGenerator : MyUIFeedbackGenerator {
    fileprivate override class var claassType: AnyClass {
        return MRUIFeedbackGenerator.self
    }
    
    package var mrui_feedbackGenerator: MRUIFeedbackGenerator {
        return unsafe unsafeDowncast(self.feedbackGenerator, to: MRUIFeedbackGenerator.self)
    }
}

@_fixed_layout
package final class MyUIImpactFeedbackGenerator : MyUIFeedbackGenerator {
    fileprivate override class var claassType: AnyClass {
        return unsafe objc_getClass("UIImpactFeedbackGenerator") as! AnyClass
    }
    
    package init(style: MyUIImpactFeedbackStyle) {
        let alloc = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyClass, Selector) -> AnyObject).self)
        var ref = alloc(Self.claassType, Selector(("alloc")))
        let initWithView = unsafe unsafeBitCast(msui_objc_msgSend(), to: (@convention(c) (AnyObject, Selector, Int) -> AnyObject).self)
        ref = initWithView(ref, Selector(("initWithStyle:")), style.rawValue)
        
        super.init(feedbackGenerator: ref)
    }
}

package enum MyUIImpactFeedbackStyle : Int {
    case light
    case medium
    case heavy
    case soft
    case rigid
}
