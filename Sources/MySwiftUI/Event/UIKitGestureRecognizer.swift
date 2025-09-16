#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

// TODO: final인지 검증
class UIKitGestureRecognizer: UIGestureRecognizer {
    weak var eventBridge: EventBindingBridge? = nil
    let twoHandedInteractionRelationshipGesture = UIKitRelationshipGestureRecognizer()
    private var inFlightTouchSerialIDs: [ObjectIdentifier : UInt32] = [:]
    private var initialScale: CGFloat = 1.0
    private var initialAngle: Angle = .zero
    private var scrollConverter = ScrollEventConverter()
    private var gestureCategory = GestureCategory(rawValue: 0)
    
    init() {
        super.init(target: nil, action: nil)
        
        allowedPressTypes = [
            NSNumber(integerLiteral: UIPress.PressType.upArrow.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.downArrow.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.leftArrow.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.rightArrow.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.select.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.menu.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.playPause.rawValue),
            NSNumber(integerLiteral: UIPress.PressType.back.rawValue)
        ]
        delaysTouchesEnded = false
    }
}
