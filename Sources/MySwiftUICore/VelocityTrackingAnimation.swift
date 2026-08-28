// FD9125BC1E04E33D1D7BE4A31225AA98

private import Foundation

extension Animation {
    @safe static let velocityTracking = Animation(VelocityTrackingAnimation())
}

fileprivate struct VelocityTrackingAnimation : CustomAnimation {
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }

    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }

    nonisolated func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
        assertUnimplemented()
    }
}
