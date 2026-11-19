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
            default:
                // TODO
                assertUnimplemented()
            }
        }
    }
}
