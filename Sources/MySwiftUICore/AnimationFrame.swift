// // 35ADF281214A25133F1A6DF28858952D

#warning("TODO")
private import CoreGraphics
internal import AttributeGraph

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
    
    mutating func updateValue() {
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
    
    mutating func destroy() {
        helper.removeListeners()
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
