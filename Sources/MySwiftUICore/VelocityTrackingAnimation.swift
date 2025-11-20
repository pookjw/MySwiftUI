// FD9125BC1E04E33D1D7BE4A31225AA98

#warning("TODO")
private import Foundation

extension Animation {
    @safe static nonisolated(unsafe) let velocityTracking = Animation(VelocityTrackingAnimation())
}

fileprivate struct VelocityTrackingAnimation: CustomAnimation {
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        fatalError("TODO")
    }
}
