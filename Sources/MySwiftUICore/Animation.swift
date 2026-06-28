// 4FD7A1D5440B1394D12A74675615ED20

public import CoreGraphics
public import Spatial
internal import AttributeGraph
private import Foundation

public struct Animation : Equatable, Sendable {
    public static func == (lhs: Animation, rhs: Animation) -> Bool {
        return lhs.box.isEqual(to: rhs.box)
    }
    
    @safe nonisolated(unsafe) private var box: AnimationBoxBase
    
    public init<A>(_ base: A) where A : CustomAnimation {
        self.box = AnimationBox(base)
    }
    
    init<A>(_ base: A) where A : InternalCustomAnimation {
        self.box = InternalAnimationBox(base)
    }
    
    package var function: Function {
        return box.function
    }
    
    @_specialize(exported: false, kind: partial, where T == Double)
    @_specialize(exported: false, kind: partial, where T == AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>)
    func animate<T : VectorArithmetic>(value: T, time: Double, context: inout AnimationContext<T>) -> T? {
        return self.box.animate(value: value, time: time, context: &context)
    }
    
    func shouldMerge<Value : VectorArithmetic>(
        previous: Animation,
        value: Value,
        time: Double,
        context: inout AnimationContext<Value>
    ) -> Bool {
        return self.box.shouldMerge(previous: previous, value: value, time: time, context: &context)
    }
    
    func velocity<Value : VectorArithmetic>(value: Value, time: Double, context: AnimationContext<Value>) -> Value? {
        return self.box.velocity(value: value, time: time, context: context)
    }
    
    @inline(always) // 원래 없음
    func internalCustomAnimation<T : InternalCustomAnimation>() -> T? {
        return (box as? InternalAnimationBox<T>)?._base
    }
}

extension Animation : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension Animation : CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    public var description: String {
        assertUnimplemented()
    }
    
    public var debugDescription: String {
        assertUnimplemented()
    }
    
    public var customMirror: Mirror {
        assertUnimplemented()
    }
}

extension Animation {
    public static let `default` = Animation(DefaultAnimation())
}

extension Animation {
    package enum Function {
        case linear(duration: Double)
        case circularEaseIn(duration: Double)
        case circularEaseOut(duration: Double)
        case circularEaseInOut(duration: Double)
        case bezier(duration: Double, CGPoint)
        case spring(duration: Double, mass: Double, stiffness: Double, damping: Double, initialVelocity: Double)
        case customFunction(Double, (inout AnimationContext<Double>) -> Double?)
        indirect case delay(Double, Animation.Function)
        indirect case speed(Double, Animation.Function)
        indirect case `repeat`(count: Double, autoreverses: Bool, Animation.Function)
    }
}

public struct AnimationContext<Value : VectorArithmetic> {
    var state: AnimationState<Value>
    private var _environment: WeakAttribute<EnvironmentValues>?
    var isLogicallyComplete: Bool
    
    init(environment: WeakAttribute<EnvironmentValues>?) {
        assertUnimplemented()
    }
    
    init(state: AnimationState<Value>, environment: Attribute<EnvironmentValues>?, isLogicallyComplete: Bool) {
        self.state = state
        self._environment = WeakAttribute(environment)
        self.isLogicallyComplete = isLogicallyComplete
    }
    
    init(state: AnimationState<Value>, environment: WeakAttribute<EnvironmentValues>?, isLogicallyComplete: Bool) {
        self.state = state
        self._environment = environment
        self.isLogicallyComplete = isLogicallyComplete
    }
    
    init(state: AnimationState<Value>, environment: WeakAttribute<EnvironmentValues>?) {
        assertUnimplemented()
    }
    
    init(environment: WeakAttribute<EnvironmentValues>?, isLogicallyComplete: Bool) {
        assertUnimplemented()
    }
    
    init(state: AnimationState<Value>, environment: Attribute<EnvironmentValues>?) {
        assertUnimplemented()
    }
    
    init(environment: Attribute<EnvironmentValues>?, isLogicallyComplete: Bool) {
        assertUnimplemented()
    }
    
    init(environment: Attribute<EnvironmentValues>?) {
        assertUnimplemented()
    }
    
    var environment: EnvironmentValues {
        assertUnimplemented()
    }
    
    func withState<T : VectorArithmetic>(_ state: AnimationState<T>) -> AnimationContext<T> {
        assertUnimplemented()
    }
}

public protocol VectorArithmetic : AdditiveArithmetic {
    mutating func scale(by rhs: Double)
    var magnitudeSquared: Double { get }
}

extension CGFloat : VectorArithmetic {
    public mutating func scale(by rhs: Double) {
       self *= rhs
    }
    
    public var magnitudeSquared: Double {
        return self * self
    }
}

extension Double : VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
}

extension Float : VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self *= Float(rhs)
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
}

extension Vector3D : VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
}

extension Size3D : VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self.uniformlyScale(by: rhs)
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
}

public protocol Animatable {
    associatedtype AnimatableData : VectorArithmetic
    
    var animatableData: Self.AnimatableData { get set }
    static func _makeAnimatable(value: inout _GraphValue<Self>, inputs: _GraphInputs)
}

extension Animatable where Self : VectorArithmetic {
    public var animatableData: Self {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension Animatable where Self.AnimatableData == EmptyAnimatableData {
    public var animatableData: EmptyAnimatableData {
        @inlinable get {
            return EmptyAnimatableData()
        }
        @inlinable set {}
    }
    
    nonisolated public static func _makeAnimatable(value: inout _GraphValue<Self>, inputs: _GraphInputs) {
    }
}

extension Animatable {
    public static func _makeAnimatable(value: inout _GraphValue<Self>, inputs: _GraphInputs) {
        // x29 = sp + 0x70
        /*
         value = x19
         inputs = x24
         */
        guard
            MemoryLayout<AnimatableData>.size != 0,
            !inputs.animationsDisabled
        else {
            return
        }
        
        // <+164>
        let attribute = AnimatableAttribute(source: value.value, phase: inputs.phase, time: inputs.time, transaction: inputs.transaction, environment: inputs.environment)
        value = _GraphValue(Attribute(attribute))
        value.value.setFlags(.unknown0, mask: .all)
    }
    
    @inline(always)
    static func makeAnimatable(value: _GraphValue<Self>, inputs: _GraphInputs) -> Attribute<Self> {
        var value = value
        _makeAnimatable(value: &value, inputs: inputs)
        return value.value
    }
}

extension Animatable {
    @inline(always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type where T : VectorArithmetic {
        get {
            T.self
        }
    }
    
    @_disfavoredOverload @inline(always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.AnimatableData.Type where T : Animatable {
        get {
            T.AnimatableData.self
        }
    }
    
    @_disfavoredOverload @inline(always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type {
        get {
            T.self
        }
    }
    
    @inline(always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get {
            self[keyPath: keyPath]
        }
        set {
            self[keyPath: keyPath] = newValue
        }
    }
    
    @_disfavoredOverload @inline(always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get {
            self[keyPath: keyPath].animatableData
        }
        set {
            self[keyPath: keyPath].animatableData = newValue
        }
    }
    
    @_disfavoredOverload @inline(always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> EmptyAnimatableData {
        get {
            .zero
        }
        nonmutating set {
            
        }
    }
    
    @inline(always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get { self[keyPath: keyPath] }
        nonmutating set { self[keyPath: keyPath] = newValue }
    }
    
    @_disfavoredOverload @inline(always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get {
            self[keyPath: keyPath].animatableData
        }
        nonmutating set {
            self[keyPath: keyPath].animatableData = newValue
        }
    }
}

@frozen public struct AnimatablePair<First : VectorArithmetic, Second : VectorArithmetic>: VectorArithmetic {
    public var first: First
    public var second: Second
    
    @inlinable public init(_ first: First, _ second: Second) {
        self.first = first
        self.second = second
    }
    
    @_alwaysEmitIntoClient package init(_ _firstType: First.Type, _ _secondType: Second.Type) {
        self.first = _firstType.zero
        self.second = _secondType.zero
    }
    
    @inlinable package subscript() -> (First, Second) {
        get {
            return (first, second)
        }
        set {
            (first, second) = newValue
        }
    }
    
    @_transparent public static var zero: AnimatablePair<First, Second> {
        @_transparent get {
            return .init(First.zero, Second.zero)
        }
    }
    
    @_transparent public static func += (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) {
        lhs.first += rhs.first
        lhs.second += rhs.second
    }
    
    @_transparent public static func -= (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) {
        lhs.first -= rhs.first
        lhs.second -= rhs.second
    }
    
    @_transparent public static func + (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second> {
        return .init(lhs.first + rhs.first, lhs.second + rhs.second)
    }
    
    @_transparent public static func - (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second> {
        return .init(lhs.first - rhs.first, lhs.second - rhs.second)
    }
    
    @_transparent public mutating func scale(by rhs: Double) {
        first.scale(by: rhs)
        second.scale(by: rhs)
    }
    
    @_transparent public var magnitudeSquared: Double {
        @_transparent get {
            return first.magnitudeSquared + second.magnitudeSquared
        }
    }
    
    public static func == (a: AnimatablePair<First, Second>, b: AnimatablePair<First, Second>) -> Bool {
        return (a.first == b.first) && (a.second == b.second)
    }
}

extension AnimatablePair : Sendable where First : Sendable, Second : Sendable {}

struct AnimatableAttributeHelper<T : Animatable> {
    @Attribute private var phase: _GraphInputs.Phase // 0x0
    @Attribute private var time: Time // 0x4
    @Attribute private var transaction: Transaction // 0x8
    private var previousModelData: T.AnimatableData? // 0x10
    private var animatorState: AnimatorState<T.AnimatableData>? // 0x20
    private var resetSeed: UInt32
    
    init(phase: Attribute<_GraphInputs.Phase>, time: Attribute<Time>, transaction: Attribute<Transaction>) {
        self._phase = phase
        self._time = time
        self._transaction = transaction
        self.animatorState = nil
        self.resetSeed = 0
    }
    
    mutating func update(
        value: inout (value: T, changed: Bool),
        defaultAnimation: Animation?,
        environment: Attribute<EnvironmentValues>,
        sampleCollector: (T.AnimatableData, Time) -> ()
    ) {
        // x29 = sp + 0x2f0
        /*
         value = x26
         defaultAnimation = sp + 0x140
         environment = sp + 0xb8
         */
        // <+744>
        let time: Time
        if animatorState == nil {
            time = -Time.infinity
        } else {
            let (_time, flags) = $time.valueAndFlags(options: [])
            if flags == .changed {
                time = _time
            } else {
                time = -Time.infinity
            }
        }
        
        // <+804>
        // self = sp + 0x1b0
        if checkReset() {
            // <+836>
            value.changed = true
        }
        
        // <+880>
        if value.changed {
            // <+936>
            // sp + 0x138
            let animatableData = value.value.animatableData
            let previousModelData = previousModelData
            
            if let previousModelData /* sp + 0x128 */, animatableData != previousModelData {
                // <+1304>
                // x23
                let transaction = Graph.withoutUpdate { 
                    // $s7SwiftUI25AnimatableAttributeHelperV6update5value16defaultAnimation11environment15sampleCollectoryxAE_Sb7changedtz_AA0I0VSg0D5Graph0D0VyAA17EnvironmentValuesVGy0C4DataQz_AA4TimeVtXEtFAA11TransactionVyXEfU_
                    return self.transaction
                }
                
                // sp + 0xf0
                if let animation = transaction.effectiveAnimation ?? defaultAnimation {
                    // <+1444>
                    // x28
                    var interval = animatableData
                    interval -= previousModelData
                    let time = self.time
                    
                    // sp + 0xf8
                    let animatorState: AnimatorState<T.AnimatableData>
                    if let _animatorState = self.animatorState {
                        animatorState = _animatorState
                        // <+1564>
                        // time = sp + 0x220
                        animatorState.combine(newAnimation: animation, newInterval: interval, at: time, in: transaction, environment: environment)
                        CustomEventTrace.animationRetarget(attribute: .current, propertyType: type(of: self), function: animation.function)
                        // <+3520>
                        let attribute = AnyAttribute.current!
                        Signpost.animationState.traceEvent(
                            type: .event,
                            object: animatorState,
                            "Animation: (%p) [%d] %{public}@ updated",
                            args: [
                                attribute.graph.counter(options: .unknown2),
                                attribute.rawValue,
                                _typeName(type(of: self), qualified: false)
                            ]
                        )
                    } else {
                        // <+2076>
                        // time = sp + 0x250
                        animatorState = AnimatorState<T.AnimatableData>(
                            animation: animation,
                            interval: interval,
                            at: time,
                            in: transaction,
                            finishingDefinition: T.self as? (any AnimationFinishingDefinition<T.AnimatableData>.Type)
                        )
                        
                        CustomEventTrace.animationBegin(attribute: .current, propertyType: type(of: self), function: animation.function)
                        let attribute = AnyAttribute.current!
                        Signpost.animationState.traceEvent(
                            type: .begin,
                            object: animatorState,
                            "Animation: (%p) [%d] %{public}@ started",
                            args: [
                                attribute.graph.counter(options: .unknown2),
                                attribute.rawValue,
                                _typeName(type(of: self), qualified: false)
                            ]
                        )
                        self.animatorState = animatorState
                    }
                    
                    // <+5076>
                    animatorState.addListeners(transaction: transaction)
                    self.previousModelData = animatableData
                } else {
                    // <+3460>
                    // <+5148>
                    self.previousModelData = animatableData
                }
            } else {
                // <+5148>
                self.previousModelData = animatableData
            }
        } else {
            // <+5244>
            // nop
        }
        
        // <+5256>
        guard let animatorState else {
            return
        }
        
        var animatableData = value.value.animatableData
        // <+5332>
        let didEnd = animatorState.update(&animatableData, at: time, environment: environment)
        
        if didEnd {
            // <+5384>
            CustomEventTrace.animationEnd(attribute: .current)
            // <+5512>
            let attribute = AnyAttribute.current!
            Signpost.animationState.traceEvent(
                type: .end,
                object: animatorState,
                "Animation: (%p) [%d] %{public}@ ended",
                args: [
                    attribute.graph.counter(options: .unknown2),
                    attribute.rawValue,
                    _typeName(type(of: self), qualified: false)
                ]
            )
            
            if let animatorState = self.animatorState {
                animatorState.removeListeners()
            }
            self.animatorState = nil
        } else {
            // <+6052>
            CustomEventTrace.animationAttrUpdate(.current)
            animatorState.nextUpdate()
            sampleCollector(animatableData, time)
        }
        
        // <+7204>
        value.value.animatableData = animatableData
        value.changed = true
    }
    
    mutating func update(
        value: inout (value: T, changed: Bool),
        defaultAnimation: Animation?,
        environment: Attribute<EnvironmentValues>
    ) {
        self.update(
            value: &value,
            defaultAnimation: defaultAnimation,
            environment: environment,
            sampleCollector: { _, _ in }
        )
    }
    
    func checkReset() -> Bool {
        if phase.resetSeed != resetSeed {
            reset()
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        assertUnimplemented()
    }
    
    func removeListeners() {
        guard let animatorState else {
            return
        }
        animatorState.removeListeners()
    }
}

struct AnimatableAttribute<T : Animatable>: CustomStringConvertible, AsyncAttribute, ObservedAttribute, StatefulRule {
    @Attribute private var source: T
    @Attribute private var environment: EnvironmentValues
    private var helper: AnimatableAttributeHelper<T>
    
    fileprivate init(
        source: Attribute<T>,
        phase: Attribute<_GraphInputs.Phase>,
        time: Attribute<Time>,
        transaction: Attribute<Transaction>,
        environment: Attribute<EnvironmentValues>
    ) {
        self._source = source
        self._environment = environment
        self.helper = AnimatableAttributeHelper(phase: phase, time: time, transaction: transaction)
    }
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = T
    
    mutating func updateValue() {
        // self = x20
        var value = $source.changedValue(options: [])
        helper.update(value: &value, defaultAnimation: nil, environment: $environment)
        
        guard value.changed || !hasValue else {
            return
        }
        
        // <+300>
        self.value = value.value
    }
    
    mutating func destroy() {
        helper.removeListeners()
    }
}

final class AnimatorState<Value : VectorArithmetic> {
    private var animation: Animation
    private var state = AnimationState<Value>()
    private var interval: Value = .zero
    private var beginTime: Time
    private var quantizedFrameInterval: Double
    private var nextTime: Time = .zero
    private var previousAnimationValue: Value = .zero
    private var reason: UInt32? = nil
    private var phase: AnimatorState<Value>.Phase = .pending
    private var listeners: [AnimationListener] = []
    private var logicalListeners: [AnimationListener] = []
    private var isLogicallyComplete: Bool = false
    private var finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)? = nil
    private var forks: [AnimatorState<Value>.Fork] = []
    
    init(animation: Animation, interval: Value, at time: Time, in transaction: Transaction) {
        assertUnimplemented()
    }
    
    init(animation: Animation, interval: Value, at time: Time, in transaction: Transaction, finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)?) {
        self.animation = animation
        self.interval = interval
        self.finishingDefinition = finishingDefinition
        self.beginTime = time
        self.nextTime = time
        
        if let animationFrameInterval = transaction.animationFrameInterval {
            if animationFrameInterval <= 0 {
                // <+600>
                self.quantizedFrameInterval = 0
                self.reason = transaction.animationReason
            } else {
                // <+464>
                var d0 = animationFrameInterval
                d0 = log2(animationFrameInterval * 240.0)
                d0 = d0 + 0.01
                d0 = floor(d0)
                d0 = exp2(d0)
                d0 = d0 * (1.0 / 240.0)
                self.quantizedFrameInterval = d0
                
                if d0 < (1.0 / 60.0) {
                    self.reason = transaction.animationReason
                } else {
                    self.reason = nil
                }
            }
        } else {
            self.quantizedFrameInterval = 0
            self.reason = nil
        }
    }
    
    func removeListeners() {
        // self -> x20 -> x22
        // <+136>
        let listeners = self.listeners
        if !listeners.isEmpty {
            for listener in listeners {
                listener.animationWasRemoved()
            }
            
            self.listeners = []
        }
        
        // <+352>
        let logicalListeners = self.logicalListeners
        if !logicalListeners.isEmpty {
            for listener in logicalListeners {
                listener.animationWasRemoved()
            }
            
            self.logicalListeners = []
        }
        
        // <+564>
        if isLinkedOnOrAfter(.v7_1) {
            // <+680>
            let forks = self.forks
            if !forks.isEmpty {
                for fork in forks {
                    for listener in fork.listeners {
                        listener.animationWasRemoved()
                    }
                }
                
                self.forks.removeAll(keepingCapacity: false)
            }
            
            // <+1232>
        } else {
            // <+1232>
        }
    }
    
    func combine(
        newAnimation: Animation,
        newInterval: Value,
        at time: Time,
        in transaction: Transaction,
        environment: Attribute<EnvironmentValues>?
    ) {
        /*
         self -> x20 -> x19
         newAnimation -> x0 -> x29 - 0x120
         newInterval -> x1 -> x25
         time -> x2
         transaction -> x3 -> x24
         environment -> x4 -> x20
         */
        let d9 = time.seconds
        // <+116>
        if self.phase == .pending && !isLinkedOnOrAfter(.v3) {
            // <+1164>
            self.animation = newAnimation
            self.interval = newInterval
            // <+840>
        } else {
            // <+132>
            // newInterval -> x25 -> x29 - 0x130
            var d0 = self.beginTime.seconds
            var d8 = d9 - d0
            // x29 - 0x80
            var context = AnimationContext(
                state: self.state,
                environment: environment,
                isLogicallyComplete: self.isLogicallyComplete
            )
            
            if let finishingDefinition {
                context.finishingDefinition = finishingDefinition
            }
            
            // <+308>
            self.forkListeners(
                animation: self.animation,
                state: self.state,
                interval: self.interval
            )
            
            // <+452>
            self.isLogicallyComplete = false
            d0 = d8
            
            let shouldMerge = newAnimation.shouldMerge(
                previous: self.animation,
                value: self.interval,
                time: d0,
                context: &context
            )
            
            if !shouldMerge {
                // <+628>
                d0 = d8
                
                combineAnimation(
                    into: &self.animation,
                    state: &self.state,
                    value: self.interval,
                    elapsed: d0,
                    newAnimation: newAnimation,
                    newValue: newInterval
                )
                
                // <+768>
            } else {
                // <+556>
                self.state = context.state
                self.animation = newAnimation
                // <+768>
            }
            
            // <+768>
            self.interval += newInterval
            self.nextTime = Time(seconds: d9)
            // <+840>
        }
        
        // <+840>
        guard let animationFrameInterval = transaction.animationFrameInterval else {
            return
        }
        
        // <+864>
        var d1 = animationFrameInterval
        var d0: Double = 0
        
        if d1 <= 0 {
            // <+944>
        } else {
            // <+880>
            d0 = 240
            d0 = d1 * d0
            d0 = log2(d0)
            d1 = 0.01
            d0 = d0 + d1
            d0 = floor(d0)
            d0 = exp2(d0)
            d1 = 1.0 / 240.0
            d0 = d0 * d1
            // <+944>
        }
        
        // <+944>
        d1 = self.quantizedFrameInterval
        d0 = (d0 < d1) ? d0 : d1
        self.quantizedFrameInterval = d0
        d1 = 1.0 / 60.0
        
        if !(d0 < d1) {
            // <+1132>
            self.reason = nil
            return
        }
        
        // <+988>
        self.reason = transaction.animationReason ?? self.reason
    }
    
    func addListeners(transaction: Transaction) {
        if let listener = transaction.animationListener {
            self.listeners.append(listener)
            listener.animationWasAdded()
        }
        
        // <+160>
        if let listener = transaction.animationLogicalListener {
            listener.animationWasAdded()
            
            if isLogicallyComplete {
                listener.animationWasRemoved()
            } else {
                self.logicalListeners.append(listener)
            }
        }
        
        // <+332>
    }
    
    func update(_ value: inout Value, at time: Time, environment: Attribute<EnvironmentValues>?) -> Bool {
        /*
         self -> x20 -> x21
         value -> x0 -> x28
         time -> x1 -> x20
         environment -> x2 -> x24
         */
        // <+184>
        let d9 = time.seconds
        var d8 = self.nextTime.seconds
        var d0 = self.quantizedFrameInterval
        var d1: Double = -0.5
        d1 = d0 * d1
        d1 = d8 + d1
        
        if !(d1 < d9) {
            // <+292>
            // x23
            value += self.previousAnimationValue
            value -= self.interval
            // <+968>
            return false
        }
        
        // <+220>
        switch self.phase {
        case .pending:
            // <+276>
            self.beginTime = Time(seconds: d9)
            self.phase = .first
            // <+584>
        case .first:
            // <+1320>
            self.phase = .second
            
            if !CoreTesting.isRunning {
                d0 = self.beginTime.seconds
                d0 = d8 - d0
                d0 = d9 + d0
                self.nextTime = Time(seconds: d0)
                self.beginTime = Time(seconds: d9)
                value += self.previousAnimationValue
                value -= self.interval
                // <+464>
                return false
            }
            
            // <+584>
        case .second:
            // <+480>
            d1 = 1.0 / 60.0
            d0 = max(d0, d1)
            d8 = d0 + d0
            d0 = self.beginTime.seconds
            d0 = d9 - d0
            
            if (d8 < d0) && !CoreTesting.isRunning {
                // <+564>
                d0 = d9 - d8
                self.beginTime = Time(seconds: d0)
            }
            
            // <+572>
            self.phase = .running
            // <+584>
        case .running:
            // <+584>
            break
        }
        
        // <+584>
        d0 = self.beginTime.seconds
        d8 = d9 - d0
        
        // x29 - 0xb0
        var context = AnimationContext(
            state: self.state,
            environment: environment,
            isLogicallyComplete: self.isLogicallyComplete
        )
        
        if let finishingDefinition {
            context.finishingDefinition = finishingDefinition
        }
        
        // <+756>
        d0 = d8
        
        let resolved = self.animation.animate(value: self.interval, time: d0, context: &context)
        
        if let resolved {
            // <+1004>
            d0 = d8
            self.updateListeners(isLogicallyComplete: context.isLogicallyComplete, time: d0, environment: environment)
            self.state = context.state
            
            // <+1084>
            value += resolved
            value -= self.interval
            
            // <+1180>
            self.previousAnimationValue = resolved
            self.nextTime = Time(seconds: d9)
            
            d0 = self.quantizedFrameInterval
            if d0 <= 0 {
                // <+1580>
                return false
            }
            
            // <+1268>
            d0 = d9 / d0
            d8 = round(d0)
            d0 = 1.0
            d0 = d8 + d0
            d1 = self.quantizedFrameInterval
            d0 = d0 * d1
            self.nextTime = Time(seconds: d0)
            return false
        } else {
            return true
        }
    }
    
    func nextUpdate() {
        CustomEventTrace.animationScheduleTick(attribute: .current, time: self.nextTime)
        
        // <+224>
        let viewGraph_1 = ViewGraph.current
        var d8 = self.nextTime.seconds
        var d0 = viewGraph_1.nextUpdate.views.time.seconds
        
        if !(d8 < d0) {
            // <+312>
        } else {
            viewGraph_1.nextUpdate.views.time = Time(seconds: d8)
        }
        
        // <+312>
        let viewGraph_2 = ViewGraph.current
        d8 = self.quantizedFrameInterval
        // w20/w22
        let reason = self.reason
        d0 = d8
        viewGraph_1.nextUpdate.views.interval(d0, reason: reason)
    }
    
    func updateListeners(isLogicallyComplete: Bool, time: Double, environment: Attribute<EnvironmentValues>?) {
        /*
         self -> x20 -> x19
         isLogicallyComplete -> w0 -> w20
         environment -> x1 -> x28
         */
        let d0 = time
        let d8 = d0
        
        // <+180>
        if !self.isLogicallyComplete && isLogicallyComplete {
            // <+200>
            self.isLogicallyComplete = isLogicallyComplete
            
            for listener in self.logicalListeners {
                listener.animationWasRemoved()
            }
            
            self.logicalListeners = []
        }
        
        // <+424>
        if !self.forks.isEmpty {
            // x29 - 0xc0
            var indexSet = IndexSet()
            // x29 - 0xa0
            let indices = self.forks.indices
            
            for index in indices {
                // <+804>
                let result = self.forks[index].update(time: time, environment: environment)
                
                guard result else {
                    continue
                }
                
                for listener in self.forks[index].listeners {
                    listener.animationWasRemoved()
                }
                
                indexSet.insert(index)
            }
            
            // <+596>
            self.forks.remove(atOffsets: indexSet)
        }
        
        // <+704>
    }
    
    func forkListeners(animation: Animation, state: AnimationState<Value>, interval: Value) {
        /*
         self -> x20
         animation -> x0 -> x29 - 0x88
         state -> x1 -> x25
         interval -> x2 -> x29 - 0x90
         */
        // <+184>
        guard !self.isLogicallyComplete else {
            return
        }
        
        guard !self.logicalListeners.isEmpty else {
            return
        }
        
        let fork = AnimatorState<Value>.Fork(
            animation: animation,
            state: state,
            interval: interval,
            finishingDefinition: self.finishingDefinition,
            listeners: self.logicalListeners
        )
        
        self.forks.append(fork)
        self.logicalListeners = []
    }
}

@frozen public struct EmptyAnimatableData : VectorArithmetic {
    @inlinable public init() {}
    
    @inlinable public static var zero: EmptyAnimatableData {
        get { return .init() }
    }
    
    @inlinable public static func += (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData) {}
    
    @inlinable public static func -= (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData) {}
    
    @inlinable public static func + (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData {
        return .zero
    }
    
    @inlinable public static func - (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData {
        return .zero
    }
    
    @inlinable public mutating func scale(by rhs: Double) {}
    
    @inlinable public var magnitudeSquared: Double {
        get { return 0 }
    }
    
    public static func == (a: EmptyAnimatableData, b: EmptyAnimatableData) -> Bool {
        assertUnimplemented()
    }
}

class AnimationBoxBase {
    var base: (any CustomAnimation) {
        preconditionFailure() // abstract
    }
    
    var function: Animation.Function {
        preconditionFailure() // abstract
    }
    
    func isEqual(to other: AnimationBoxBase) -> Bool {
        preconditionFailure() // abstract
    }
    
    func hash(into hasher: inout Hasher) {
        preconditionFailure() // abstract
    }
    
    func animate<A : VectorArithmetic>(value: A, time: Double, context: inout AnimationContext<A>) -> A? {
        preconditionFailure() // abstract
    }
    
    func velocity<A : VectorArithmetic>(value: A, time: Double, context: AnimationContext<A>) -> A? {
        preconditionFailure() // abstract
    }
    
    func shouldMerge<A : VectorArithmetic>(previous: Animation, value: A, time: Double, context: inout AnimationContext<A>) -> Bool {
        preconditionFailure() // abstract
    }
    
    func modifier<A : CustomAnimationModifier>(_ modifier: A) -> Animation {
        preconditionFailure() // abstract
    }
}

fileprivate class AnimationBox<T : CustomAnimation>: AnimationBoxBase {
    var _base: T
    
    init(_ base: T) {
        self._base = base
    }
    
    @_specialize(exported: false, kind: partial, where U == Double)
    @_specialize(exported: false, kind: partial, where U == AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>)
    override func animate<U>(value: U, time: Double, context: inout AnimationContext<U>) -> U? where U : VectorArithmetic {
        return _base.animate(value: value, time: time, context: &context)
    }
    
    override func velocity<A>(value: A, time: Double, context: AnimationContext<A>) -> A? where A : VectorArithmetic {
        return _base.velocity(value: value, time: time, context: context)
    }
    
    override func shouldMerge<A>(
        previous: Animation,
        value: A,
        time: Double,
        context: inout AnimationContext<A>
    ) -> Bool where A : VectorArithmetic {
        return _base.shouldMerge(previous: previous, value: value, time: time, context: &context)
    }
    
    override func modifier<A>(_ modifier: A) -> Animation where A : CustomAnimationModifier {
        assertUnimplemented()
    }
    
    override var function: Animation.Function {
        assertUnimplemented()
    }
    
    override var base: any CustomAnimation {
        assertUnimplemented()
    }
    
    override func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnimationBoxBase) -> Bool {
        /*
         self -> x20 -> x19
         other -> x0 -> x21
         */
        let casted = other as? AnimationBox<T>
        return casted.map { other in
            // $s7SwiftUI12AnimationBox33_4FD7A1D5440B1394D12A74675615ED20LLC7isEqual2toSbAA0cD4BaseC_tFSbADyxGXEfU_TA
            return other._base == self._base
        } ?? false
    }
}

fileprivate final class InternalAnimationBox<T>: AnimationBox<T> where T : InternalCustomAnimation {
    override func modifier<A>(_ modifier: A) -> Animation where A : CustomAnimationModifier {
        assertUnimplemented()
    }
    
    override var function: Animation.Function {
        return _base.function
    }
}

struct DefaultAnimation: InternalCustomAnimation, Hashable, ProtobufEncodableMessage, ProtobufDecodableMessage, EncodableAnimation {
    static func makeBaseAnimation() -> Animation {
        if isDeployedOnOrAfter(.v5) {
            // <+212>
            return Animation(
                FluidSpringAnimation(
                    response: 0.5,
                    dampingFraction: 1,
                    blendDuration: 0
                )
            )
        } else {
            // <+112>
            return Animation(
                BezierAnimation(
                    curve: UnitCurve
                        .CubicSolver(
                            ax: 0.35,
                            bx: 0.52,
                            cx: -0.78,
                            ay: 1.26,
                            by: -2,
                            cy: 3
                        ),
                    duration: 0
                )
            )
        }
    }
    
    static let base = makeBaseAnimation()
    
    init() {}
    
    @_specialize(exported: false, kind: partial, where V == Double)
    @_specialize(exported: false, kind: partial, where V == AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>)
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        return DefaultAnimation.base.animate(value: value, time: time, context: &context)
    }
    
    nonisolated func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic {
        return DefaultAnimation.base.shouldMerge(previous: previous, value: value, time: time, context: &context)
    }
    
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        return DefaultAnimation.base.velocity(value: value, time: time, context: context)
    }
    
    var function: Animation.Function {
        return Self.base.function
    }
}

protocol EncodableAnimation {
    // TODO
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct AnimationState<Value : VectorArithmetic> {
    private var storage: [ObjectIdentifier : Any]
    
    public init() {
        storage = Dictionary()
    }
    
    public subscript<K>(key: K.Type) -> K.Value where K : AnimationStateKey {
        get {
            if let existing = storage[ObjectIdentifier(K.self)] {
                return existing as! K.Value
            } else {
                return K.defaultValue
            }
        }
        set {
            storage[ObjectIdentifier(K.self)] = newValue
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public protocol AnimationStateKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}

extension AnimatorState {
    fileprivate enum Phase {
        case pending
        case first
        case second
        case running
    }
    
    fileprivate struct Fork {
        private(set) var animation: Animation
        private(set) var state: AnimationState<Value>
        private(set) var interval: Value
        private(set) var finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)?
        private(set) var listeners: [AnimationListener]
        
        mutating func update(time: Double, environment: Attribute<EnvironmentValues>?) -> Bool {
            /*
             self -> x20 -> x28
             environment -> x0 -> x20
             */
            var d0 = time
            let d8 = d0
            // <+304>
            // x29 - 0x78
            var context = AnimationContext(
                state: self.state,
                environment: environment,
                isLogicallyComplete: false
            )
            
            if let finishingDefinition {
                context.finishingDefinition = finishingDefinition
            }
            
            d0 = d8
            // x25
            let animationTime = self.animation.animate(value: self.interval, time: d0, context: &context)
            
            if animationTime == nil {
                return true
            } else {
                return context.isLogicallyComplete
            }
        }
    }
}

struct BezierAnimation : InternalCustomAnimation, Hashable, ProtobufEncodableMessage, ProtobufDecodableMessage, EncodableAnimation {
    private var duration: Double
    private var curve: UnitCurve.CubicSolver
    
    init(_: Double, _: Double, _: Double, _: Double, duration: Double) {
        assertUnimplemented()
    }
    
    init(curve: UnitCurve.CubicSolver, duration: Double) {
        self.duration = duration
        self.curve = curve
    }
    
    var function: Animation.Function {
        assertUnimplemented()
    }
    
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }
    
    // TODO
}

func combineAnimation<Value : VectorArithmetic>(
    into animation: inout Animation,
    state: inout AnimationState<Value>,
    value: Value,
    elapsed: Double,
    newAnimation: Animation,
    newValue: Value
) {
    assertUnimplemented()
}
