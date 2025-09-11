#warning("TODO")

internal import UIKit
@_spi(Internal) internal import MySwiftUICore

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
        fatalError("TODO")
    }
}
