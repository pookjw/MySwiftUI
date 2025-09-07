#warning("TODO")
internal import UIKit
internal import _UIKitShims

class UIKitSensoryFeedbackCache {
    // $s7SwiftUI14_UIHostingViewC13feedbackCacheAA020UIKitSensoryFeedbackF0Cvg
    weak var host: UIView? = nil
    var cachedGenerators: [SensoryFeedback.FeedbackType: MyUIFeedbackGenerator] = [:]
}
