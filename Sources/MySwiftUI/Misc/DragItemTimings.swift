#warning("TODO")
internal import MySwiftUICore
private import CoreGraphics

struct DragItemTimings {
    private var liftDelay: Double? = nil
    private var pointerLiftDelay: Double? = nil
    private var cancellationDelay: Double? = nil
    private var competingLongPressDelay: Double? = nil
    private var liftMoveHysteresis: CGFloat? = nil
    private var pointerLiftMoveHysteresis: CGFloat? = nil
    private var allowsPointerDragBeforeLiftDelay: Bool? = nil
}

extension DragItemTimings {
    struct Key: HostPreferenceKey {
        static var defaultValue: DragItemTimings {
            return DragItemTimings()
        }
    }
}
