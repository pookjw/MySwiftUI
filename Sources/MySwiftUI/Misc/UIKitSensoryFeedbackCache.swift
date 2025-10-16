#warning("TODO")
internal import UIKit
internal import _UIKitShims

// TODO: final인지 검증
class UIKitSensoryFeedbackCache {
    weak var host: UIView? = nil
    var cachedGenerators: [SensoryFeedback.FeedbackType: MyUIFeedbackGenerator] = [:]
}
