@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 26.0, *)
public struct SensoryFeedback : Equatable, Sendable {
    private var type: FeedbackType
    
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
        case impactWeight(SensoryFeedback.Weight.Storage, Double)
        case impactFlexibility(SensoryFeedback.Flexibility.Storage, Double)
        case success
        case warning
        case error
        case increase
        case decrease
        case selection
        case alignment
        case levelChange
        case start
        case stop
        case pathComplete
        case circularButtonTouchDown
        case buttonWithBackgroundTouchDown
        case sliderTouchDown
        case sliderTouchUp
        case sliderSlidToMaximumValue
        case sliderSlidToMinimumValue
        case tabViewItemTouchDown
        case toggleTouchDown
        case toggleSetToOn
        case toggleSetToOff
        case buttonNavigationBarTouchDown
        case buttonToggleOn
        case buttonToggleOff
        case buttonWithoutBackgroundTouchDown
        case buttonStepperMinusTouchDown
        case buttonStepperPlusTouchDown
        case handFlipPalmDown
        case handFlipPalmUp
        case handReveal
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
