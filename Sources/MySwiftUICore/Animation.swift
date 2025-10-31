// 35ADF281214A25133F1A6DF28858952D

#warning("TODO")
public import CoreGraphics
public import Spatial
internal import AttributeGraph

public struct Animation: Equatable, Sendable {
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
        fatalError("TODO")
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
        fatalError("TODO")
    }
}

extension Animatable {
    public static func _makeAnimatable(value: inout _GraphValue<Self>, inputs: _GraphInputs) {
        // x29 = sp + 0x70
        /*
         value = x19
         inputs = x24
         */
        guard !inputs.options.contains(.animationsDisabled) else {
            return
        }
        
        // <+164>
        let attribute = AnimatableAttribute(source: value.value, phase: inputs.phase, time: inputs.time, transaction: inputs.transaction, environment: inputs.environment)
        value = _GraphValue(Attribute(attribute))
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
    
    @_transparent public mutating func scale(by rhs: Swift.Double) {
        first.scale(by: rhs)
        second.scale(by: rhs)
    }
    
    @_transparent public var magnitudeSquared: Double {
        @_transparent get {
            return first.magnitudeSquared + second.magnitudeSquared
        }
    }
    
    public static func == (a: AnimatablePair<First, Second>, b: AnimatablePair<First, Second>) -> Bool {
        fatalError("TODO")
    }
}

extension AnimatablePair: Sendable where First : Sendable, Second : Sendable {}

struct AnimatableFrameAttribute: StatefulRule, AsyncAttribute, ObservedAttribute {
    typealias Value = ViewFrame
    @Attribute private var position: CGPoint
    @Attribute private var size: ViewSize
    @Attribute private var pixelLength: CGFloat
    @Attribute private var environment: EnvironmentValues
    private var helper: AnimatableAttributeHelper<ViewFrame>
    private let animationsDisabled: Bool
    
    init(
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        pixelLength: Attribute<CGFloat>,
        environment: Attribute<EnvironmentValues>,
        phase: Attribute<_GraphInputs.Phase>,
        time: Attribute<Time>,
        transaction: Attribute<Transaction>,
        animationsDisabled: Bool
    ) {
        self._position = position
        self._size = size
        self._pixelLength = pixelLength
        self._environment = environment
        self.helper = AnimatableAttributeHelper(phase: phase, time: time, transaction: transaction)
        self.animationsDisabled = animationsDisabled
    }
    
    func updateValue() {
        // self = x19
        let (position, positionChanged) = $position.changedValue(options: [])
        let (size, sizeChanged) = $size.changedValue(options: [])
        let (pixelLength, pixelLengthChanged) = $pixelLength.changedValue(options: [])
        // sp, #0x80
        var changed = (positionChanged || sizeChanged || pixelLengthChanged)
        
        var frame = ViewFrame(origin: position, size: size)
        frame.round(toMultipleOf: pixelLength)
        
        if !animationsDisabled {
            var lvalue = (value: frame, changed: changed)
            helper.update(value: &lvalue, defaultAnimation: nil, environment: $environment)
            frame = lvalue.value
            changed = lvalue.changed
        }
        
        // <+216>
        var flag = changed
        if !changed {
            flag = !self.hasValue
        }
        if flag {
            self.value = frame
        }
    }
    
    func destroy() {
        fatalError("TODO")
    }
}

struct AnimatableFrameAttributeVFD: StatefulRule, AsyncAttribute, ObservedAttribute {
    typealias Value = ViewFrame
    
    @Attribute private var position: CGPoint
    @Attribute private var size: ViewSize
    @Attribute private var pixelLength: CGFloat
    @Attribute private var environment: EnvironmentValues
    private var helper: AnimatableAttributeHelper<ViewFrame>
    private var velocityFilter: FrameVelocityFilter
    private let animationsDisabled: Bool
    
    init(
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        pixelLength: Attribute<CGFloat>,
        environment: Attribute<EnvironmentValues>,
        phase: Attribute<_GraphInputs.Phase>,
        time: Attribute<Time>,
        transaction: Attribute<Transaction>,
        animationsDisabled: Bool
    ) {
        self._position = position
        self._size = size
        self._pixelLength = pixelLength
        self._environment = environment
        self.helper = AnimatableAttributeHelper(phase: phase, time: time, transaction: transaction)
        self.velocityFilter = FrameVelocityFilter(currentVelocity: nil, previous: nil)
        self.animationsDisabled = animationsDisabled
    }
    
    func updateValue() {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
}

fileprivate struct FrameVelocityFilter {
    var currentVelocity: Double?
    var previous: ((Time, AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>))?
    
    func addSample(_: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>, time: Time) {
        fatalError("TODO")
    }
}

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
    
    func update(value: inout (value: T, changed: Bool), defaultAnimation: Animation?, environment: Attribute<EnvironmentValues>) {
        // $s7SwiftUI25AnimatableAttributeHelperV6update5value16defaultAnimation11environment15sampleCollectoryxAE_Sb7changedtz_AA0I0VSg0D5Graph0D0VyAA17EnvironmentValuesVGy0C4DataQz_AA4TimeVtXEtF
        // x29 = sp + 0x2f0
        /*
         value = x26
         defaultAnimation = sp + 0x60
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
        if checkReset() {
            // <+836>
            value.changed = true
        }
        
        // <+880>
        if value.changed {
            // <+936>
            // x25
            let animatableData = value.value.animatableData
            fatalError("TODO")
        } else {
            // <+1144>
            fatalError("TODO")
        }
        fatalError("TODO")
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
    
    func updateValue() {
        // self = x20
        var value = $source.changedValue(options: [])
        helper.update(value: &value, defaultAnimation: nil, environment: $environment)
        
        guard value.changed, !hasValue else {
            return
        }
        
        // <+300>
        self.value = value.value
    }
    
    func destroy() {
        fatalError("TODO")
    }
}

final class AnimatorState<T> {
    //    var animation: Animation
    //    var state: AnimationState<T>
    //    var interval: T
    //    var beginTime: Time
    //    var quantizedFrameInterval: Double
    //    var nextTime: Time
    //    var previousAnimationValue: T
    //    var reason: UInt32?
    //    var phase: AnimatorState<T>.Phase
    //    var listeners: [AnimationListener]
    //    var logicalListeners: [AnimationListener]
    //    var isLogicallyComplete: Bool
    //    var finishingDefinition: (null)
    //    var forks: AnimatorState<T>.Fork
    
    init() {
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
