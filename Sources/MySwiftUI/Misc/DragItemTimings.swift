#warning("TODO")
internal import MySwiftUICore
private import CoreGraphics
internal import UIKit

struct DragItemTimings {
    private var liftDelay: Double? = nil
    private var pointerLiftDelay: Double? = nil
    private var cancellationDelay: Double? = nil
    private var competingLongPressDelay: Double? = nil
    private var liftMoveHysteresis: CGFloat? = nil
    private var pointerLiftMoveHysteresis: CGFloat? = nil
    private var allowsPointerDragBeforeLiftDelay: Bool? = nil
    
    func apply(to: UIDragInteraction) {
        fatalError("TODO")
    }
}

extension DragItemTimings {
    struct Key: HostPreferenceKey {
        static var defaultValue: DragItemTimings {
            return DragItemTimings()
        }
    }
}
