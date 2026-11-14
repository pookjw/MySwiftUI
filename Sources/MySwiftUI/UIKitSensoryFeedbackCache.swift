internal import UIKit
internal import _UIKitShims

final class UIKitSensoryFeedbackCache {
    weak var host: UIView? = nil
    var cachedGenerators: [SensoryFeedback.FeedbackType: MyUIFeedbackGenerator] = [:]
    
    func implementation(type: SensoryFeedback.FeedbackType) -> (any LocationBasedSensoryFeedback)? {
        assertUnimplemented()
    }
}
