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
        var d8 = d0
        
        // <+352>
        let d13 = self.response
        var d10 = self.dampingFraction
        let d15 = self.blendDuration
        
        // context -> x29 - 0x130 -> x27
        // x28
        var springState = context.springState
        d0 = d13
        
        if (d15 > 0) && (springState.blendInterval != 0) {
            // <+488>
            let d1 = springState.blendInterval
            d0 = springState.blendStart
            d0 = d8 - d0
            d0 = d0 / d15
            let d2: Double = 1.0
            var d3 = (d0 > d2) ? d2 : d0
            let f = (d0 >= 0)
            d0 = 0
            d0 = f ? d3 : d0
            d3 = d0 * d0
            d0 = d0 + d0
            let d4: Double = 3.0
            d0 = d4 - d0
            d0 = d3 * d0
            d0 = d2 - d0
            d0 = d1 * d0
            d0 = d13 + d0
            // <+556>
        }
        
        // <+556>
        var d1: Double
        if d0 <= 0 {
            // <+700>
            d1 = .infinity
            // <+708>
        } else {
            // <+572>
            d1 = Double.pi * 2
            d1 = d1 / d0
            d1 = d1 * d1
            // <+708>
        }
        
        // <+708>
        let d2: Double = 45000.nextDown
        var d9 = (d1 > d2) ? d2 : d1
        d1 = springState.startTime
        d1 = d8 - d1
        
        if d0 <= d1 {
            // <+748>
            context.isLogicallyComplete = true
            // <+756>
        }
        
        // <+756>
        var d14 = springState.time
        d0 = d8 - d14
        d1 = 1
        
        if d0 > d1 {
            // <+788>
            d0 = -1.0 / 60.0
            d14 = d8 + d0
            springState.time = d14
            // <+808>
        }
        
        if !(d14 < d8) {
            // <+1472>
        } else {
            // <+824>
            d0 = sqrt(d9)
            d0 = d0 + d0
            let x290x160 = d10
            d10 = -(d10 * d0)
            let d11: Double = 1.0 / 600.0
            let d12: Double = 1.0 / 300.0
            // <+964>
            
            repeat {
                // <+964>
                d0 = d11
                // x23 (x29 - 0xc8)
                var x23 = springState.force
                x23.scale(by: d0)
                x23 += springState.velocity
                
                // <+1064>
                // x20 (x29 - 0xd8)
                var x20 = x23
                d0 = d12
                x20.scale(by: d0)
                springState.offset += x20
                
                // <+1124>
                var x27 = x23
                d0 = d10
                x27.scale(by: d0)
                
                // x24 (x29 - 0xd0)
                var x24 = value
                x24 -= springState.offset
                d0 = d9
                x24.scale(by: d0)
                
                springState.force = x27
                springState.force += x24
                
                // <+1272>
                springState.velocity = springState.force
                d0 = d11
                springState.velocity.scale(by: d0)
                springState.velocity += x23
                
                // <+1356>
                d14 = d14 + d12
            } while d14 < d8
            
            // <+1420>
            springState.time = d14
            d10 = x290x160
            // <+1472>
        }
        
        // <+1472>
        context.springState = springState
        
        var x25 = value
        x25 -= springState.offset
        
        let shouldFinishEarly = context.shouldFinishEarly(data: {
            // $s7SwiftUI20FluidSpringAnimationV7animate5value4time7contextxSgx_SdAA0E7ContextVyxGztAA16VectorArithmeticRzlFAA0e8SettlingJ0V4DataVyx_GyXEfu0_TA
            /*
             x25 -> x0
             springState -> x1 -> x20
             d13 -> d0 -> d9
             d10 -> d1 -> d8
             d15 -> d2
             */
            var d0 = d13
            var d1 = d10
            let d2 = d15
            
            let d9 = d0
            let d8 = d1
            
            let x25 = x25
            let x23 = springState.velocity
            d0 = Double.pi * 2
            d0 = d0 / d9
            d0 = d0 * d0
            d1 = sqrt(d0)
            d1 = d1 + d1
            d1 = d8 * d1
            d0 = d1 / d0
            
            let x24 = x23.scaled(by: d0)
            
            return AnimationSettlingContext<V>.Data(
                delta: x25,
                velocity: x24
            )
        }())
        
        if shouldFinishEarly {
            // <+1620>
            return nil
        }
        
        // <+1660>
        d0 = springState.velocity.magnitudeSquared
        d8 = d0
        d0 = springState.force.magnitudeSquared
        d0 = (d8 <= d0) ? d0 : d8
        d1 = 0.0036
        
        if !(d0 > d1) {
            // <+1884>
            // springState -> x28 -> x29 - 0xc8
            // x28 (x29 - 0x150)
            var x28 = value
            d0 = 0.01
            x28.scale(by: d0)
            d0 = x28.magnitudeSquared
            
            if !(d0 > 0) {
                // <+2096>
                return nil
            } else {
                // <+1972>
                d8 = d0
                d0 = x25.magnitudeSquared
                d9 = d0
                
                if !(d8 < d9) {
                    // <+2116>
                    return nil
                } else {
                    // <+2024>
                    return springState.offset
                }
            }
        } else {
            // <+1744>
            return springState.offset
        }
    }
    
    nonisolated func shouldMerge<V>(
        previous: Animation,
        value: V,
        time: TimeInterval,
        context: inout AnimationContext<V>
    ) -> Bool where V : VectorArithmetic {
        /*
         self -> x20 -> x29 - 0x80
         previous -> x0 -> x29 - 0x70
         value -> x1 -> x29 - 0x78
         context -> x2 -> x20
         */
        var d0 = time
        let d8 = d0
        // <+320>
        let d9 = self.response
        // x24
        var springState = context.springState
        d0 = d8
        // x23 -> x19
        let velocity = previous.velocity(value: value, time: d0, context: context)
        
        let x25: V
        if let velocity {
            // <+520>
            x25 = velocity
        } else {
            // <+444>
            x25 = springState.velocity
            // <+544>
        }
        // <+544>
        springState.velocity = x25
        
        d0 = d8
        // x26
        let animationTime = previous.animate(value: value, time: d0, context: &context)
        if let animationTime {
            springState.offset = animationTime
        } else {
            // <+672>
            springState.offset = value
        }
        
        // <+760>
        springState.time = d8
        springState.startTime = d8
        
        if let animation: FluidSpringAnimation = previous.internalCustomAnimation() {
            d0 = animation.response
            if d9 == d0 {
                // <+856>
            } else {
                d0 = d0 - d9
                springState.blendInterval = d0
                springState.blendStart = d8
            }
        }
        
        // <+856>
        context.springState = springState
        return true
    }
    
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        return context.springState.velocity
    }
}

extension AnimationContext {
    fileprivate var springState: SpringState<Value> {
        get {
            return self.state[SpringState<Value>.self]
        }
        set {
            self.state[SpringState<Value>.self] = newValue
        }
    }
    
    func shouldFinishEarly(data: @autoclosure () -> AnimationSettlingContext<Value>.Data) -> Bool {
        guard let finishingDefinition else {
            return false
        }
        
        let context = AnimationSettlingContext<Value>(
            data: data(),
            environment: self.environment
        )
        
        return finishingDefinition.shouldFinishEarly(in: context)
    }
}

fileprivate struct SpringState<V : VectorArithmetic> : AnimationStateKey {
    // CGFloat 기준
    var offset: V // 0x0
    var velocity: V // 0x8
    var force: V // 0x10
    var time: Double // 0x18
    var startTime: Double // 0x20
    var blendStart: Double // 0x28
    var blendInterval: Double // 0x30
    
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

struct AnimationSettlingContext<Value : VectorArithmetic> {
    private var data: AnimationSettlingContext<Value>.Data
    private var environment: EnvironmentValues
    
    init(data: AnimationSettlingContext<Value>.Data, environment: EnvironmentValues) {
        assertUnimplemented()
    }
}

extension AnimationSettlingContext {
    struct Data {
        init(delta: Value, velocity: Value) {
            assertUnimplemented()
        }
        
        private var delta: Value
        private var velocity: Value
    }
}
