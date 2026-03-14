public import Foundation

@preconcurrency public protocol CustomAnimation: Hashable, Sendable {
    nonisolated func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic
    
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic
    
    nonisolated func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic
}

extension CustomAnimation {
    public func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }
    
    public func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
        assertUnimplemented()
    }
}

protocol InternalCustomAnimation {
    // TODO
}

protocol CustomAnimationModifier {
    // TODO
}
