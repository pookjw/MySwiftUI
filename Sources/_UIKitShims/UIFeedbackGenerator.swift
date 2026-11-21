package import UIKit
private import ObjectiveC.runtime
package import MRUIKit

@_fixed_layout
package class MyUIFeedbackGenerator {
    fileprivate class var claassType: AnyClass {
        return unsafe objc_getClass("UIFeedbackGenerator") as! AnyClass
    }
    
    package let feedbackGenerator: AnyObject
    
    package init(view: UIView?) {
        self.feedbackGenerator = (Self.claassType as AnyObject)
            .alloc()
            ._init(view: view)
    }
    
    package init() {
        self.feedbackGenerator = (Self.claassType as AnyObject)
            .alloc()
            ._init()
    }
    
    package final func prepare() {
        self.feedbackGenerator._prepare()
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
        let ref = (Self.claassType as AnyObject)
            .alloc()
            ._init(style: style.rawValue)
        
        super.init(feedbackGenerator: ref)
    }
    
    package func impactOccurred(intensity: CGFloat, at location: CGPoint) {
        feedbackGenerator.impactOccurred(intensity: intensity, at: location)
    }
}

package enum MyUIImpactFeedbackStyle : Int {
    case light
    case medium
    case heavy
    case soft
    case rigid
}

@_fixed_layout
package final class MyUINotificationFeedbackGenerator : MyUIFeedbackGenerator {
    fileprivate override class var claassType: AnyClass {
        return unsafe objc_getClass("UINotificationFeedbackGenerator") as! AnyClass
    }
}

package enum MyUINotificationFeedbackType : Int {
    case success
    case warning
    case error
}

@_fixed_layout
package final class MyUISelectionFeedbackGenerator : MyUIFeedbackGenerator {
    fileprivate override class var claassType: AnyClass {
        return unsafe objc_getClass("UISelectionFeedbackGenerator") as! AnyClass
    }
}

@_fixed_layout
package final class MyUICanvasFeedbackGenerator : MyUIFeedbackGenerator {
    fileprivate override class var claassType: AnyClass {
        return unsafe objc_getClass("UICanvasFeedbackGenerator") as! AnyClass
    }
}

fileprivate final class PrivateSelectors {
    @objc(alloc) func alloc() -> AnyObject {
        fatalError()
    }

    @objc(init) func _init() -> AnyObject {
        fatalError()
    }

    @objc(initWithView:) func _init(view: UIView?) -> AnyObject {
        fatalError()
    }

    @objc(initWithStyle:) func _init(style: Int) -> AnyObject {
        fatalError()
    }

    @objc(prepare) func _prepare() {
        fatalError()
    }

    @objc(impactOccurredWithIntensity:atLocation:) func impactOccurred(intensity: CGFloat, at location: CGPoint) {
        fatalError()
    }
}
