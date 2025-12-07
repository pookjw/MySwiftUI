// 4FD7A1D5440B1394D12A74675615ED20

#warning("TODO")
public import CoreGraphics
public import Spatial
internal import AttributeGraph

public struct Animation: Equatable, Sendable {
    public static func == (lhs: Animation, rhs: Animation) -> Bool {
        fatalError("TODO")
    }
    
    private var box: AnimationBoxBase
    
    public init<A>(_ base: A) where A : CustomAnimation {
        self.box = AnimationBox(base)
    }
    
    package var function: Function {
        fatalError("TODO")
    }
}

extension Animation {
    public static let `default`: Animation = {
        fatalError("TODO")
    }()
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

public struct AnimationContext<Value: VectorArithmetic> {
    
}

public protocol VectorArithmetic : AdditiveArithmetic {
    mutating func scale(by rhs: Double)
    var magnitudeSquared: Double { get }
}

extension CGFloat: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Double: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Float: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self *= Float(rhs)
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Vector3D: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Size3D: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
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
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
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
    
    public static func _makeAnimatable(value: inout _GraphValue<Self>, inputs: _GraphInputs) {
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
    
    @inline(__always)
    static func makeAnimatable(value: _GraphValue<Self>, inputs: _GraphInputs) -> Attribute<Self> {
        var value = value
        _makeAnimatable(value: &value, inputs: inputs)
        return value.value
    }
}

extension Animatable {
    @inline(__always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type where T : VectorArithmetic {
        get {
            T.self
        }
    }
    
    @_disfavoredOverload @inline(__always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.AnimatableData.Type where T : Animatable {
        get {
            T.AnimatableData.self
        }
    }
    
    @_disfavoredOverload @inline(__always) @_alwaysEmitIntoClient public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type {
        get {
            T.self
        }
    }
    
    @inline(__always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get {
            self[keyPath: keyPath]
        }
        set {
            self[keyPath: keyPath] = newValue
        }
    }
    
    @_disfavoredOverload @inline(__always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get {
            self[keyPath: keyPath].animatableData
        }
        set {
            self[keyPath: keyPath].animatableData = newValue
        }
    }
    
    @_disfavoredOverload @inline(__always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> EmptyAnimatableData {
        get {
            .zero
        }
        nonmutating set {
            
        }
    }
    
    @inline(__always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get { self[keyPath: keyPath] }
        nonmutating set { self[keyPath: keyPath] = newValue }
    }
    
    @_disfavoredOverload @inline(__always) @_alwaysEmitIntoClient public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get {
            self[keyPath: keyPath].animatableData
        }
        nonmutating set {
            self[keyPath: keyPath].animatableData = newValue
        }
    }
}

@frozen public struct AnimatablePair<First: VectorArithmetic, Second: VectorArithmetic>: VectorArithmetic {
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

extension AnimatablePair: Sendable where First : Sendable, Second : Sendable {}

struct AnimatableAttributeHelper<T: Animatable> {
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
    
    mutating func update(value: inout (value: T, changed: Bool), defaultAnimation: Animation?, environment: Attribute<EnvironmentValues>) {
        // $s7SwiftUI25AnimatableAttributeHelperV6update5value16defaultAnimation11environment15sampleCollectoryxAE_Sb7changedtz_AA0I0VSg0D5Graph0D0VyAA17EnvironmentValuesVGy0C4DataQz_AA4TimeVtXEtF
        // $s7SwiftUI25AnimatableAttributeHelperV6update5value16defaultAnimation11environment15sampleCollectoryxAE_Sb7changedtz_AA0I0VSg0D5Graph0D0VyAA17EnvironmentValuesVGy0C4DataQz_AA4TimeVtXEtFAA9ViewFrameV_Tg503$s7a4UI25cde88V6update5value16defaultAnimation11environmentyxAE_Sb7changedtz_AA0I0VSg0D5Graph0D0VyAA17op8VGtFy0C4q6Qz_AA4r10VtXEfU_AA9sT5V_TG5Tf1nnncn_n
        
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
                            finishingDefinition: T.self as? AnimationFinishingDefinition<T.AnimatableData>.Type
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
        }
        
        // <+7204>
        value.value.animatableData = animatableData
        value.changed = true
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
        fatalError("TODO")
    }
    
    func removeListeners() {
        guard let animatorState else {
            return
        }
        animatorState.removeListeners()
    }
}

struct AnimatableAttribute<T: Animatable>: CustomStringConvertible, AsyncAttribute, ObservedAttribute, StatefulRule {
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
        fatalError("TODO")
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

final class AnimatorState<Value: VectorArithmetic> {
    //    var animation: Animation
    //    var state: AnimationState<Value>
    //    var interval: Value
    //    var beginTime: Time
    //    var quantizedFrameInterval: Double
    //    var nextTime: Time
    //    var previousAnimationValue: Value
    //    var reason: UInt32?
    //    var phase: AnimatorState<Value>.Phase
    //    var listeners: [AnimationListener]
    //    var logicalListeners: [AnimationListener]
    //    var isLogicallyComplete: Bool
    //    var finishingDefinition: (null)
    //    var forks: AnimatorState<Value>.Fork
    
    init(animation: Animation, interval: Value, at: Time, in: Transaction) {
        fatalError("TODO")
    }
    
    init(animation: Animation, interval: Value, at: Time, in: Transaction, finishingDefinition: (any AnimationFinishingDefinition<Value>.Type)?) {
        fatalError("TODO")
    }
    
    func removeListeners() {
        // v7_1 분기 있는듯
        fatalError("TODO")
    }
    
    func combine(newAnimation: Animation, newInterval: Value, at: Time, in: Transaction, environment: Attribute<EnvironmentValues>?) {
        fatalError("TODO")
    }
    
    func addListeners(transaction: Transaction) {
        fatalError("TODO")
    }
    
    func update(_: inout Value, at: Time, environment: Attribute<EnvironmentValues>?) -> Bool {
        fatalError("TODO")
    }
    
    func nextUpdate() {
        fatalError("TODO")
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
        fatalError("TODO")
    }
}

extension VectorArithmetic {
    static var unitScale: Double {
        return 128
    }
    
    static var inverseUnitScale: Double {
        return 1.0 / .unitScale
    }
    
    mutating func applyUnitScale() {
        scale(by: Self.unitScale)
    }
    
    mutating func unapplyUnitScale() {
        scale(by: Self.inverseUnitScale)
    }
}

protocol AnimationFinishingDefinition<Value>: VectorArithmetic {
    associatedtype Value
}

class AnimationBoxBase: @unchecked Sendable {
    var base: (any CustomAnimation) {
        fatalError() // abstract
    }
    
    var function: Animation.Function {
        fatalError() // abstract
    }
    
    func isEqual(to: AnimationBoxBase) -> Bool {
        fatalError() // abstract
    }
    
    func hash(into hasher: inout Hasher) {
        fatalError() // abstract
    }
    
    func animate<A: VectorArithmetic>(value: A, time: Double, context: inout AnimationContext<A>) -> A? {
        fatalError() // abstract
    }
    
    func velocity<A: VectorArithmetic>(value: A, time: Double, context: AnimationContext<A>) -> A? {
        fatalError() // abstract
    }
    
    func shouldMerge<A: VectorArithmetic>(previous: Animation, value: A, time: Double, context: inout AnimationContext<A>) -> Bool {
        fatalError() // abstract
    }
    
    func modifier<A: CustomAnimationModifier>(_ modifier: A) -> Animation {
        fatalError() // abstract
    }
}

fileprivate class AnimationBox<T: CustomAnimation>: AnimationBoxBase {
    var _base: T
    
    init(_ base: T) {
        self._base = base
    }
    
    override func animate<A>(value: A, time: Double, context: inout AnimationContext<A>) -> A? where A : VectorArithmetic {
        fatalError("TODO")
    }
    
    override func velocity<A>(value: A, time: Double, context: AnimationContext<A>) -> A? where A : VectorArithmetic {
        fatalError("TODO")
    }
    
    override func shouldMerge<A>(previous: Animation, value: A, time: Double, context: inout AnimationContext<A>) -> Bool where A : VectorArithmetic {
        fatalError("TODO")
    }
    
    override func modifier<A>(_ modifier: A) -> Animation where A : CustomAnimationModifier {
        fatalError("TODO")
    }
    
    override var function: Animation.Function {
        fatalError("TODO")
    }
    
    override var base: any CustomAnimation {
        fatalError("TODO")
    }
    
    override func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
    
    override func isEqual(to: AnimationBoxBase) -> Bool {
        fatalError("TODO")
    }
}

fileprivate final class InternalAnimationBox<T: CustomAnimation>: AnimationBox<T> {
    override func modifier<A>(_ modifier: A) -> Animation where A : CustomAnimationModifier {
        fatalError("TODO")
    }
    
    override var function: Animation.Function {
        fatalError("TODO")
    }
}

@frozen public struct _AnyAnimatableData: VectorArithmetic {
    package var vtable: _AnyAnimatableDataVTable.Type {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    package var value: Any {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    public static var zero: _AnyAnimatableData {
        fatalError("TODO")
    }
    
    public static func == (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> Bool {
        fatalError("TODO")
    }
    
    public static func += (lhs: inout _AnyAnimatableData, rhs: _AnyAnimatableData) {
        fatalError("TODO")
    }
    
    public static func -= (lhs: inout _AnyAnimatableData, rhs: _AnyAnimatableData) {
        fatalError("TODO")
    }
    
    @_transparent public static func + (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> _AnyAnimatableData {
        var ret = lhs
        ret += rhs
        return ret
    }
    @_transparent public static func - (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> _AnyAnimatableData {
        var ret = lhs
        ret -= rhs
        return ret
    }
    
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension _AnyAnimatableData: Sendable {
}

@usableFromInline
package class _AnyAnimatableDataVTable {
    @usableFromInline deinit {}
}

@available(*, unavailable)
extension _AnyAnimatableDataVTable: Sendable {
}
