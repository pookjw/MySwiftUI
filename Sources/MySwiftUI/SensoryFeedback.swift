// E5C2FE5C277CCA85C518490456542950
internal import MRUIKit
public import MySwiftUICore
internal import AttributeGraph

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 26.0, *)
extension View {
    nonisolated public func sensoryFeedback<T>(_ feedback: SensoryFeedback, trigger: T) -> some View where T: Equatable {
        assertUnimplemented()
    }

    nonisolated public func sensoryFeedback<T>(_ feedback: SensoryFeedback, trigger: T, condition: @escaping (_ oldValue: T, _ newValue: T) -> Bool) -> some View where T: Equatable {
        assertUnimplemented()
    }

    nonisolated public func sensoryFeedback<T>(trigger: T, _ feedback: @escaping (_ oldValue: T, _ newValue: T) -> SensoryFeedback?) -> some View where T: Equatable {
        let context = FeedbackRequestContext(location: WeakAttribute(), cache: nil)
        let generator = CustomFeedbackGenerator(
            feedbackRequestContext: context,
            trigger: trigger,
            feedback: feedback
        )
        
        return self.platformSensoryFeedback(generator)
    }

    @_alwaysEmitIntoClient nonisolated public func sensoryFeedback<T>(trigger: T, _ feedback: @escaping () -> SensoryFeedback?) -> some View where T: Equatable {
        self.sensoryFeedback(trigger: trigger, { _, _ in feedback() })
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 26.0, *)
public struct SensoryFeedback : Equatable, Sendable {
    fileprivate private(set) var type: SensoryFeedback.FeedbackType
    
    public static let success = SensoryFeedback(type: .success)
    public static let warning = SensoryFeedback(type: .warning)
    public static let error = SensoryFeedback(type: .error)
    public static let selection = SensoryFeedback(type: .selection)
    public static let increase = SensoryFeedback(type: .increase)
    public static let decrease = SensoryFeedback(type: .decrease)
    public static let start = SensoryFeedback(type: .start)
    public static let stop = SensoryFeedback(type: .stop)
    public static let alignment = SensoryFeedback(type: .alignment)
    public static let levelChange = SensoryFeedback(type: .levelChange)
    public static let pathComplete = SensoryFeedback(type: .pathComplete)
    public static let impact = SensoryFeedback(type: .impactWeight(.light, 1.0))
    
    public static func impact(weight: SensoryFeedback.Weight = .medium, intensity: Double = 1.0) -> SensoryFeedback {
        return SensoryFeedback(type: .impactWeight(weight.storage, intensity))
    }
    
    public static func impact(flexibility: SensoryFeedback.Flexibility, intensity: Double = 1.0) -> SensoryFeedback {
        return SensoryFeedback(type: .impactFlexibility(flexibility.storage, intensity))
    }
}

extension SensoryFeedback {
    public struct Weight : Equatable, Sendable {
        fileprivate private(set) var storage: SensoryFeedback.Weight.Storage
        
        public static let light: SensoryFeedback.Weight = SensoryFeedback.Weight(storage: .light)
        public static let medium: SensoryFeedback.Weight = SensoryFeedback.Weight(storage: .light)
        public static let heavy: SensoryFeedback.Weight = SensoryFeedback.Weight(storage: .light)
    }
}

extension SensoryFeedback.Weight {
    enum Storage : Hashable {
        case light
        case medium
        case heavy
    }
}

extension SensoryFeedback {
    public struct Flexibility : Equatable, Sendable {
        fileprivate private(set) var storage: SensoryFeedback.Flexibility.Storage
        
        public static let rigid = SensoryFeedback.Flexibility(storage: .rigid)
        public static let solid = SensoryFeedback.Flexibility(storage: .solid)
        public static let soft = SensoryFeedback.Flexibility(storage: .soft)
    }
}

extension SensoryFeedback.Flexibility {
    enum Storage : Hashable {
        case rigid
        case solid
        case soft
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension SensoryFeedback {
    public static func selection(_ feedback: SensoryFeedback.SelectionFeedback) -> SensoryFeedback {
        return SensoryFeedback(type: feedback.storage)
    }
    
    public static func press(_ feedback: SensoryFeedback.PressFeedback) -> SensoryFeedback {
        return SensoryFeedback(type: feedback.storage)
    }
    
    public static func release(_ feedback: SensoryFeedback.ReleaseFeedback) -> SensoryFeedback {
        return SensoryFeedback(type: feedback.storage)
    }
    
    public struct SelectionFeedback : Sendable, Equatable, Hashable {
         var storage: SensoryFeedback.FeedbackType
        
        public static let maximum = SensoryFeedback.SelectionFeedback(storage: .sliderSlidToMaximumValue)
        public static let minimum = SensoryFeedback.SelectionFeedback(storage: .sliderSlidToMinimumValue)
        public static let on = SensoryFeedback.SelectionFeedback(storage: .toggleSetToOn)
        public static let off = SensoryFeedback.SelectionFeedback(storage: .toggleSetToOff)
    }
    
    public struct PressFeedback : Sendable, Equatable, Hashable {
        fileprivate private(set) var storage: SensoryFeedback.FeedbackType
        
        public static let button = SensoryFeedback.PressFeedback(storage: .buttonWithBackgroundTouchDown)
        public static let buttonIconOnly = SensoryFeedback.PressFeedback(storage: .circularButtonTouchDown)
        public static let slider = SensoryFeedback.PressFeedback(storage: .sliderTouchDown)
        public static let toggle = SensoryFeedback.PressFeedback(storage: .toggleTouchDown)
        public static let tab = SensoryFeedback.PressFeedback(storage: .tabViewItemTouchDown)
    }
    
    public struct ReleaseFeedback : Sendable, Equatable, Hashable {
        fileprivate private(set) var storage: SensoryFeedback.FeedbackType
        
        public static let slider = SensoryFeedback.ReleaseFeedback(storage: .sliderTouchUp)
    }
}

extension SensoryFeedback {
    enum FeedbackType : Hashable, Sendable {
        // >> 62
        case impactWeight(SensoryFeedback.Weight.Storage, Double) // (0x0 | storage) / intensity
        case impactFlexibility(SensoryFeedback.Flexibility.Storage, Double) // (0x4000000000000000 | storage) / intensity
        case success // 0x8000000000000000 / 0x0
        case warning // 0x8000000000000001 / 0x0
        case error // 0x8000000000000002 / 0x0
        case increase // 0x8000000000000003 / 0x0
        case decrease // 0x8000000000000000 / 0x1
        case selection // 0x8000000000000001 / 0x1
        case alignment // 0x8000000000000002 / 0x1
        case levelChange // 0x8000000000000003 / 0x1
        case start // 0x8000000000000000 / 0x2
        case stop // 0x8000000000000001 / 0x2
        case pathComplete // 0x8000000000000002 / 0x2
        case circularButtonTouchDown // 0x8000000000000003 / 0x2
        case buttonWithBackgroundTouchDown // 0x8000000000000000 / 0x3
        case sliderTouchDown // 0x8000000000000001 / 0x3
        case sliderTouchUp // 0x8000000000000002 / 0x3
        case sliderSlidToMaximumValue // 0x8000000000000003 / 0x3
        case sliderSlidToMinimumValue // 0x8000000000000000 / 0x4
        case tabViewItemTouchDown // 0x8000000000000001 / 0x4
        case toggleTouchDown // 0x8000000000000002 / 0x4
        case toggleSetToOn // 0x8000000000000003 / 0x4
        case toggleSetToOff // 0x8000000000000000 / 0x5
        case buttonNavigationBarTouchDown // 0x8000000000000001 / 0x5
        case buttonToggleOn // 0x8000000000000002 / 0x5
        case buttonToggleOff // 0x8000000000000003 / 0x5
        case buttonWithoutBackgroundTouchDown // 0x8000000000000000 / 0x6
        case buttonStepperMinusTouchDown // 0x8000000000000001 / 0x6
        case buttonStepperPlusTouchDown // 0x8000000000000002 / 0x6
        case handFlipPalmDown // 0x8000000000000003 / 0x6
        case handFlipPalmUp // 0x8000000000000000 / 0x7
        case handReveal // 0x8000000000000001 / 0x7
        
        var mruiFeedbackType: MRUIFeedbackType? {
            switch self {
            case .impactWeight:
                return nil
            case .impactFlexibility:
                return nil
            case .success:
                return nil
            case .warning:
                return nil
            case .error:
                return nil
            case .increase:
                return .buttonStepperPlusTouchDown
            case .decrease:
                return .buttonStepperMinusTouchDown
            case .selection:
                return nil
            case .alignment:
                return nil
            case .levelChange:
                return nil
            case .start:
                return nil
            case .stop:
                return nil
            case .pathComplete:
                return nil
            case .circularButtonTouchDown:
                return .circularButtonTouchDown
            case .buttonWithBackgroundTouchDown:
                return .buttonWithBackgroundTouchDown
            case .sliderTouchDown:
                return .sliderTouchDown
            case .sliderTouchUp:
                return .sliderTouchUp
            case .sliderSlidToMaximumValue:
                return .sliderSlidToMaximumValue
            case .sliderSlidToMinimumValue:
                return .sliderSlidToMinimumValue
            case .tabViewItemTouchDown:
                return .tabViewItemTouchDown
            case .toggleTouchDown:
                return .toggleTouchDown
            case .toggleSetToOn:
                return .toggleSetToOn
            case .toggleSetToOff:
                return .toggleSetToOff
            case .buttonNavigationBarTouchDown:
                return .buttonNavigationBarTouchDown
            case .buttonToggleOn:
                return .buttonToggleOn
            case .buttonToggleOff:
                return .buttonToggleOff
            case .buttonWithoutBackgroundTouchDown:
                return .buttonWithoutBackgroundTouchDown
            case .buttonStepperMinusTouchDown:
                return .buttonStepperMinusTouchDown
            case .buttonStepperPlusTouchDown:
                return .buttonStepperPlusTouchDown
            case .handFlipPalmDown:
                return .handFlipPalmDown
            case .handFlipPalmUp:
                return .handFlipPalmUp
            case .handReveal:
                return .handReveal
            }
        }
    }
}

extension SensoryFeedback {
    struct ButtonInteractionState : Hashable {
        private var storage: SensoryFeedback.FeedbackType
        
        static let pressed = SensoryFeedback.ButtonInteractionState(storage: .buttonWithBackgroundTouchDown)
        static let pressedIconOnly = SensoryFeedback.ButtonInteractionState(storage: .circularButtonTouchDown)
    }
    
    struct SliderInteractionState : Hashable {
        private var storage: SensoryFeedback.FeedbackType
        
        static let pressed = SensoryFeedback.SliderInteractionState(storage: .sliderTouchDown)
        static let released = SensoryFeedback.SliderInteractionState(storage: .sliderTouchUp)
        static let slidToMaximumValue = SensoryFeedback.SliderInteractionState(storage: .sliderSlidToMaximumValue)
        static let slidToMinimumValue = SensoryFeedback.SliderInteractionState(storage: .sliderSlidToMinimumValue)
    }
    
    struct StepperInteractionState : Hashable {
        private var storage: SensoryFeedback.FeedbackType
        
        static let minusPressed = SensoryFeedback.StepperInteractionState(storage: .buttonStepperPlusTouchDown)
        static let plusPressed = SensoryFeedback.StepperInteractionState(storage: .buttonStepperMinusTouchDown)
    }
    
    struct TabViewInteractionState : Hashable {
        private var storage: SensoryFeedback.FeedbackType
        
        static let itemPressed = SensoryFeedback.TabViewInteractionState(storage: .tabViewItemTouchDown)
    }
    
    struct ToggleInteractionState : Hashable {
        private var storage: SensoryFeedback.FeedbackType
        
        static let pressed = SensoryFeedback.ToggleInteractionState(storage: .toggleTouchDown)
        static let setToOn = SensoryFeedback.ToggleInteractionState(storage: .toggleSetToOn)
        static let setToOff = SensoryFeedback.ToggleInteractionState(storage: .toggleSetToOff)
    }
}

fileprivate struct CustomFeedbackGenerator<T : Equatable> : SensoryFeedbackGeneratorModifier {
    @safe nonisolated(unsafe) var feedbackRequestContext: FeedbackRequestContext // 0x0
    @safe private nonisolated(unsafe) var trigger: T // 0x24 (offset field)
    @safe private nonisolated(unsafe) var feedback: (T, T) -> SensoryFeedback? // 0x28 (offset field)
    @State private var state: (feedback: SensoryFeedback, implementation: (any PlatformSensoryFeedback)?)?
    
    nonisolated init(
        feedbackRequestContext: FeedbackRequestContext,
        trigger: T,
        feedback: @escaping (T, T) -> SensoryFeedback?
    ) {
        self.feedbackRequestContext = feedbackRequestContext
        self.trigger = trigger
        self.feedback = feedback
        self.state = nil
    }
    
    func body(content: Content) -> some View {
        StaticIf(idiom: .vision) {
            // $s7SwiftUI23CustomFeedbackGenerator33_E5C2FE5C277CCA85C518490456542950LLV4body7contentQrAA21_ViewModifier_ContentVyADyxGG_tFAD0m14ConfiguredWithD0AFQrAJ_tFQOyx_Qo_yXEfU_TA
            self.contentConfiguredWithFeedback(content: content)
        } else: {
            // $s7SwiftUI23CustomFeedbackGenerator33_E5C2FE5C277CCA85C518490456542950LLV4body7contentQrAA21_ViewModifier_ContentVyADyxGG_tFAJyXEfU0_TA
            content
        }
    }
    
    func contentConfiguredWithFeedback(content: _ViewModifier_Content<CustomFeedbackGenerator<T>>) -> some View {
        content
            .onChange(of: self.trigger, initial: false) { oldValue, newValue in
                // $s7SwiftUI23CustomFeedbackGenerator33_E5C2FE5C277CCA85C518490456542950LLV021contentConfiguredWithD00L0QrAA21_ViewModifier_ContentVyADyxGG_tFyx_xtcfU_TA
                // $s7SwiftUI23CustomFeedbackGenerator33_E5C2FE5C277CCA85C518490456542950LLV021contentConfiguredWithD00L0QrAA21_ViewModifier_ContentVyADyxGG_tFyx_xtcfU_
                let feedback = self.feedback(oldValue, newValue)
                
                if self.state?.feedback == feedback {
                    // <+544>
                } else {
                    // <+236>
                    self.state?.implementation?.tearDown()
                    
                    var state: (feedback: SensoryFeedback, implementation: (any PlatformSensoryFeedback)?)? = nil
                    
                    if let feedback {
                        let block: (SensoryFeedback) -> (feedback: SensoryFeedback, implementation: (any PlatformSensoryFeedback)?) = { feedback in
                            // $s7SwiftUI23CustomFeedbackGenerator33_E5C2FE5C277CCA85C518490456542950LLV021contentConfiguredWithD00L0QrAA21_ViewModifier_ContentVyADyxGG_tFyx_xtcfU_AA07SensoryD0V_AA08PlatformrD0_pSgtALXEfU_
                            guard
                                let cache = self.feedbackRequestContext.cache,
                                let impl = cache.implementation(type: feedback.type),
                                let location = self.feedbackRequestContext.location.attribute
                            else {
                                return (feedback, nil)
                            }
                            
                            let adaptor = LocationBasedFeedbackAdaptor(location: location, base: impl)
                            return (feedback, adaptor)
                        }
                        
                        state = block(feedback)
                    }
                    
                    self.state = state
                    self.state?.implementation?.setUp()
                }
                
                // <+544>
                self.state?.implementation?.generate()
            }
    }
}

protocol PlatformSensoryFeedback {
    mutating func setUp()
    mutating func tearDown()
    mutating func generate()
}

protocol LocationBasedSensoryFeedback : PlatformSensoryFeedback {
    mutating func generate(location: CGPoint)
}

struct LocationBasedFeedbackAdaptor : PlatformSensoryFeedback {
    private(set) var location: Attribute<CGPoint>
    private(set) var base: any LocationBasedSensoryFeedback
    
    mutating func setUp() {
        self.base.setUp()
    }
    
    mutating func tearDown() {
        self.base.tearDown()
    }
    
    mutating func generate() {
        let location = Update.ensure {
            // $s7SwiftUI28LocationBasedFeedbackAdaptorV8generateyyFSo7CGPointVyXEfU_TA
            return Graph.withoutUpdate { 
                return self.location.value
            }
        }
        
        self.base.generate(location: location)
    }
}

protocol SensoryFeedbackGeneratorModifier : ViewModifier {
    var feedbackRequestContext: FeedbackRequestContext { get set }
}
