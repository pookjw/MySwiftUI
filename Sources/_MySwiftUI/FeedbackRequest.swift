@_spi(Internal) internal import MySwiftUICore
internal import Spatial
private import AttributeGraph
internal import MRUIKit

struct FeedbackRequest {
    let feedbackType: _FeedbackGeneratorProxy.FeedbackType
    let seed: FeedbackRequest.Seed
}

extension FeedbackRequest {
    struct Seed: Hashable {
        private let value: Int
    }
    
    struct PreferenceKey: HostPreferenceKey {
        static let defaultValue: [ViewIdentity: (Size3D, [FeedbackRequest])] = [:]
        
        static func reduce(value: inout [ViewIdentity : (Size3D, [FeedbackRequest])], nextValue: () -> [ViewIdentity : (Size3D, [FeedbackRequest])]) {
            fatalError("TODO")
        }
    }
}

struct _FeedbackGeneratorProxy {
    @WeakAttribute private var storage: [FeedbackRequest]?
    private weak var host: GraphHost?
    
    enum FeedbackType: Hashable {
        case unspecified
        case buttonNavigationBarHover
        case buttonNavigationBarTouchDown
        case buttonNavigationBarTouchUp
        case buttonStandardHover
        case circularButtonTouchDown
        case circularButtonTouchUp
        case buttonWithBackgroundTouchDown
        case buttonWithBackgroundTouchUp
        case buttonToggleOn
        case buttonToggleOff
        case buttonWithoutBackgroundTouchDown
        case buttonWithoutBackgroundTouchUp
        case buttonStepperMinusHover
        case buttonStepperMinusTouchDown
        case buttonStepperMinusTouchUp
        case buttonStepperPlusHover
        case buttonStepperPlusTouchDown
        case buttonStepperPlusTouchUp
        case handConceal
        case handFlipPalmDown
        case handFlipPalmUp
        case handReveal
        case sliderHover
        case sliderTouchDown
        case sliderTouchUp
        case sliderSlidToMaximumValue
        case sliderSlidToMinimumValue
        case tabViewItemHover
        case tabViewItemTouchDown
        case tabViewItemTouchUp
        case tabViewItemsContainerExpanded
        case tabViewItemsContainerClosed
        case toggleHover
        case toggleTouchDown
        case toggleSetToOn
        case toggleSetToOff
        
        var mruiFeedbackType: MRUIFeedbackType {
            switch self {
            case .unspecified:
                return .unspecified
            case .buttonNavigationBarHover:
                return .unspecified
            case .buttonNavigationBarTouchDown:
                return .buttonNavigationBarTouchDown
            case .buttonNavigationBarTouchUp:
                return .unspecified
            case .buttonStandardHover:
                return .unspecified
            case .circularButtonTouchDown:
                return .circularButtonTouchDown
            case .circularButtonTouchUp:
                return .unspecified
            case .buttonWithBackgroundTouchDown:
                return .buttonWithBackgroundTouchDown
            case .buttonWithBackgroundTouchUp:
                return .unspecified
            case .buttonToggleOn:
                return .buttonToggleOn
            case .buttonToggleOff:
                return .buttonToggleOff
            case .buttonWithoutBackgroundTouchDown:
                return .buttonWithoutBackgroundTouchDown
            case .buttonWithoutBackgroundTouchUp:
                return .unspecified
            case .buttonStepperMinusHover:
                return .unspecified
            case .buttonStepperMinusTouchDown:
                return .buttonStepperMinusTouchDown
            case .buttonStepperMinusTouchUp:
                return .unspecified
            case .buttonStepperPlusHover:
                return .unspecified
            case .buttonStepperPlusTouchDown:
                return .buttonStepperPlusTouchDown
            case .buttonStepperPlusTouchUp:
                return .unspecified
            case .handConceal:
                return .unspecified
            case .handFlipPalmDown:
                return .handFlipPalmDown
            case .handFlipPalmUp:
                return .handFlipPalmUp
            case .handReveal:
                return .handReveal
            case .sliderHover:
                return .unspecified
            case .sliderTouchDown:
                return .sliderTouchDown
            case .sliderTouchUp:
                return .sliderTouchUp
            case .sliderSlidToMaximumValue:
                return .sliderSlidToMaximumValue
            case .sliderSlidToMinimumValue:
                return .sliderSlidToMinimumValue
            case .tabViewItemHover:
                return .unspecified
            case .tabViewItemTouchDown:
                return .tabViewItemTouchDown
            case .tabViewItemTouchUp:
                return .unspecified
            case .tabViewItemsContainerExpanded:
                return .unspecified
            case .tabViewItemsContainerClosed:
                return .unspecified
            case .toggleHover:
                return .unspecified
            case .toggleTouchDown:
                return .toggleTouchDown
            case .toggleSetToOn:
                return .toggleSetToOn
            case .toggleSetToOff:
                return .toggleSetToOff
            }
        }
    }
}
