public import Foundation
public import UIKit

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, tvOS 26.0, *)
public enum AccessibilityEvents {
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    @preconcurrency @MainActor public struct RotorNavigation : Event {
        @MainActor @preconcurrency public let rotorType: AccessibilityComponent.RotorType
        @MainActor @preconcurrency public let hostEntity: Entity
        @MainActor @preconcurrency public let currentItem: Any?
        @MainActor @preconcurrency public let searchDirection: UIAccessibilityCustomRotor.Direction
        @MainActor @preconcurrency public let resultHandler: (Any) -> Void
        @MainActor @preconcurrency public init(rotorType: AccessibilityComponent.RotorType, hostEntity: Entity, currentItem: Any?, searchDirection: UIAccessibilityCustomRotor.Direction, resultHandler: @escaping (Any) -> Void) {
            assertUnimplemented()
        }
    }
    
    public struct Activate : Event {
        public var entity: Entity
        
        public init(entity: Entity) {
            assertUnimplemented()
        }
    }
    
    public struct Increment : Event {
        public var entity: Entity
        
        public init(entity: Entity) {
            assertUnimplemented()
        }
    }
    
    public struct Decrement : Event {
        public var entity: Entity
        
        public init(entity: Entity) {
            assertUnimplemented()
        }
    }
    
    public struct CustomAction : Event {
        public var key: LocalizedStringResource
        
        public var entity: Entity
        
        public init(key: LocalizedStringResource, entity: Entity) {
            assertUnimplemented()
        }
    }
}
