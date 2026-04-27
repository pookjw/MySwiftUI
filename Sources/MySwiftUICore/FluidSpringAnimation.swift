// 73E5E3E568519775ECB92F029EBA0DDA
internal import Foundation

struct FluidSpringAnimation : InternalCustomAnimation, Hashable, ProtobufEncodableMessage, ProtobufDecodableMessage, EncodableAnimation {
    private(set) var response: Double
    private(set) var dampingFraction: Double
    private(set) var blendDuration: Double
    
    init(response: Double, dampingFraction: Double, blendDuration: Double) {
        self.response = response
        self.dampingFraction = dampingFraction
        self.blendDuration = blendDuration
    }
    
    @_specialize(exported: false, kind: partial, where V == Double)
    @_specialize(exported: false, kind: partial, where V == AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>)
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        /*
         value -> x0 -> x27 -> x29 - 0xf8
         context -> x1 -> x23 -> x29 - 0x130
         */
        var d0: Double = time
        let d8 = d0
        
        // <+352>
        let d13 = self.response
        let d10 = self.dampingFraction
        let d15 = self.blendDuration
        
        // context -> x29 - 0x130 -> x27
        // x28
        let springState = context.springState
        assertUnimplemented()
    }
}

extension AnimationContext {
    fileprivate var springState: SpringState<Value> {
        return self.state[SpringState<Value>.self]
    }
}

fileprivate struct SpringState<V : VectorArithmetic> : AnimationStateKey {
    private(set) var offset: V
    private(set) var velocity: V
    private(set) var force: V
    private(set) var time: Double
    private(set) var startTime: Double
    private(set) var blendStart: Double
    private(set) var blendInterval: Double
    
    init() {
        self.offset = .zero
        self.velocity = .zero
        self.force = .zero
        self.time = 0
        self.startTime = 0
        self.blendStart = 0
        self.blendInterval = 0
    }
    
    static var defaultValue: SpringState<V> {
        return SpringState<V>()
    }
}
