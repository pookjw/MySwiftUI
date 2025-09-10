#warning("TODO")

internal import UIKit
@_spi(Internal) internal import MySwiftUICore

class UIKitGestureRecognizer: UIGestureRecognizer {
    weak var eventBridge: EventBindingBridge? = nil
    let twoHandedInteractionRelationshipGesture = UIKitRelationshipGestureRecognizer()
    private var inFlightTouchSerialIDs: [ObjectIdentifier : UInt32] = [:]
    private var initialScale: CGFloat
    private var initialAngle: Angle
    private var scrollConverter: ScrollEventConverter
    private var gestureCategory: GestureCategory
    
    init() {
        fatalError("TODO")
        super.init(target: nil, action: nil)
        fatalError("TODO")
    }
}
