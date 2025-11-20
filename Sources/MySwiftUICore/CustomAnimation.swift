#warning("TODO")
public import Foundation

@preconcurrency public protocol CustomAnimation: Hashable, Sendable {
    nonisolated func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic
    
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic
    
    nonisolated func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic
}

extension CustomAnimation {
    public func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        fatalError("TODO")
    }
    
    public func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
        fatalError("TODO")
    }
}

protocol InternalCustomAnimation {
    // TODO
}

protocol CustomAnimationModifier {
    // TODO
}
