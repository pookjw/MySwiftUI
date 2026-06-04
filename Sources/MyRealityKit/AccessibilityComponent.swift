public import Foundation
public import UIKit

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, tvOS 26.0, *)
extension AccessibilityComponent {
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    public enum RotorType : Equatable {
        case system(UIAccessibilityCustomRotor.SystemRotorType)
        case custom(LocalizedStringResource)
        
        public static func == (a: AccessibilityComponent.RotorType, b: AccessibilityComponent.RotorType) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    public var traits: UIAccessibilityTraits {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    public var customRotors: [AccessibilityComponent.RotorType] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
