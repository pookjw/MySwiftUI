public import Foundation

@preconcurrency public protocol CustomAnimation : Hashable, Sendable {
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

protocol InternalCustomAnimation : CustomAnimation {
    var function: Animation.Function { get }
}

protocol CustomAnimationModifier : Hashable {
    func animate<V, Base>(base: Base, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic, Base : CustomAnimation
    
    func velocity<V, Base>(base: Base, value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic, Base : CustomAnimation
    
    func shouldMerge<V, Base>(base: Base, previous: Animation, previousBase: Base, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic, Base : CustomAnimation
    
    func function(base: Animation.Function) -> Animation.Function
}

extension CustomAnimationModifier {
    func velocity<V, Base>(base: Base, value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic, Base : CustomAnimation {
        assertUnimplemented()
    }
    
    func shouldMerge<V, Base>(base: Base, previous: Animation, previousBase: Base, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic, Base : CustomAnimation {
        assertUnimplemented()
    }
}
