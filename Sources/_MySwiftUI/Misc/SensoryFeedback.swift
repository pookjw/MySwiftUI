
public struct SensoryFeedback: Equatable, Sendable {
    
}

extension SensoryFeedback {
    public struct Weight : Equatable, Sendable {
        
    }
}

extension SensoryFeedback.Weight {
    enum Storage {
        case light
        case medium
        case heavy
    }
}

extension SensoryFeedback {
    public struct Flexibility : Equatable, Sendable {
    }
}

extension SensoryFeedback.Flexibility {
    enum Storage {
        case rigid
        case solid
        case soft
    }
}

extension SensoryFeedback {
    enum FeedbackType: Hashable {
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
