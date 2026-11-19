internal import UIKit
internal import _UIKitShims
private import MRUIKit
private import _UIKitPrivate
private import _MySwiftUIShims

final class UIKitSensoryFeedbackCache {
    weak var host: UIView? = nil
    var cachedGenerators: [SensoryFeedback.FeedbackType: MyUIFeedbackGenerator] = [:]
    
    func implementation(type: SensoryFeedback.FeedbackType) -> (any LocationBasedSensoryFeedback)? {
        if let mruiFeedbackType = type.mruiFeedbackType {
            // <+172>
            let generator: MRUIFeedbackGenerator
            if let cached = self.cachedGenerators[type] {
                generator = (cached as! MyMRUIFeedbackGenerator).mrui_feedbackGenerator
            } else {
                let value = MyMRUIFeedbackGenerator(view: self.host)
                self.cachedGenerators[type] = value
                
                if let host {
                    unsafe host.myswiftui_addManagedInteraction(
                        unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                    )
                }
                
                generator = value.mrui_feedbackGenerator
            }
            
            let impl = MRUIFeedbackImplementation(
                generator: generator,
                type: mruiFeedbackType
            )
            
            return impl
        } else {
            // <+60>
            switch type {
            case .impactWeight(let storage, let intensity):
                // <+76>
                let generator: MyUIFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    generator = cached
                    // <+1036>
                } else {
                    // <+884>
                    let style: MyUIImpactFeedbackStyle
                    switch storage {
                    case .light:
                        style = .light
                    case .medium:
                        style = .medium
                    case .heavy:
                        style = .heavy
                    }
                    
                    let value = MyUIImpactFeedbackGenerator(style: style)
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                // <+1036>
                return ImpactFeedbackImplementation(
                    generator: generator as! MyUIImpactFeedbackGenerator,
                    intensity: intensity
                )
            case .impactFlexibility(let storage, let intensity):
                // <+568>
                let generator: MyUIFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    generator = cached
                } else {
                    // <+1048>
                    let style: MyUIImpactFeedbackStyle
                    switch storage {
                    case .rigid:
                        style = .rigid
                    case .solid:
                        style = .medium
                    case .soft:
                        style = .soft
                    }
                    
                    let value = MyUIImpactFeedbackGenerator(style: style)
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                // <+1036>
                return ImpactFeedbackImplementation(
                    generator: generator as! MyUIImpactFeedbackGenerator,
                    intensity: intensity
                )
            case .success:
                // <+2144>
                let generator: MyUINotificationFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    // <+2212>
                    generator = cached as! MyUINotificationFeedbackGenerator
                    // <+2740>
                } else {
                    // <+2592>
                    
                    let value = MyUINotificationFeedbackGenerator()
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                // <+1248>
                return NotificationFeedbackImplementation(generator: generator, type: .success)
            case .warning:
                // <+2012>
                let generator: MyUINotificationFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    generator = cached as! MyUINotificationFeedbackGenerator
                } else {
                    let value = MyUINotificationFeedbackGenerator()
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                return NotificationFeedbackImplementation(generator: generator, type: .warning)
            case .error:
                // <+752>
                let generator: MyUINotificationFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    generator = cached as! MyUINotificationFeedbackGenerator
                } else {
                    let value = MyUINotificationFeedbackGenerator()
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                return NotificationFeedbackImplementation(generator: generator, type: .error)
            case .increase, .decrease, .selection:
                // <+1388>
                let generator: MyUISelectionFeedbackGenerator
                if let cached = self.cachedGenerators[.selection] {
                    generator = cached as! MyUISelectionFeedbackGenerator
                } else {
                    let value = MyUISelectionFeedbackGenerator()
                    self.cachedGenerators[.selection] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                return SelectionFeedbackImplementation(generator: generator)
            case .alignment, .pathComplete:
                // <+1712>
                let generator: MyUICanvasFeedbackGenerator
                if let cached = self.cachedGenerators[type] {
                    generator = cached as! MyUICanvasFeedbackGenerator
                } else {
                    let value = MyUICanvasFeedbackGenerator()
                    self.cachedGenerators[type] = value
                    
                    if let host {
                        unsafe host.myswiftui_addManagedInteraction(
                            unsafeBitCast(value.feedbackGenerator, to: (any UIInteraction & Sendable).self)
                        )
                    }
                    
                    generator = value
                }
                
                return CanvasFeedbackImplementation(generator: generator, type: type)
            case .levelChange, .start, .stop, .circularButtonTouchDown, .buttonWithBackgroundTouchDown, .sliderTouchDown, .sliderTouchUp, .sliderSlidToMaximumValue, .sliderSlidToMinimumValue, .tabViewItemTouchDown, .toggleTouchDown, .toggleSetToOn, .toggleSetToOff, .buttonNavigationBarTouchDown, .buttonToggleOn, .buttonToggleOff, .buttonWithoutBackgroundTouchDown, .buttonStepperMinusTouchDown, .buttonStepperPlusTouchDown, .handFlipPalmDown, .handFlipPalmUp, .handReveal:
                // <+552>
                return nil
            }
        }
    }
}
