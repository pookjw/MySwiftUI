public import Foundation
public import Accessibility

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, tvOS 26.0, *)
public struct AccessibilityComponent : Component {
    public struct CustomContent : Equatable {
        public var label: LocalizedStringResource
        
        public var value: LocalizedStringResource
        
        public var importance: AXCustomContent.Importance
        
        public init(label: LocalizedStringResource, value: LocalizedStringResource, importance: AXCustomContent.Importance) {
            assertUnimplemented()
        }
        
        public static func == (a: AccessibilityComponent.CustomContent, b: AccessibilityComponent.CustomContent) -> Bool {
            assertUnimplemented()
        }
    }
    
    public struct SupportedActions : OptionSet {
        public let rawValue: Int
        
        @safe public static nonisolated(unsafe) let activate: AccessibilityComponent.SupportedActions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let increment: AccessibilityComponent.SupportedActions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let decrement: AccessibilityComponent.SupportedActions = {
            assertUnimplemented()
        }()
        
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 17.0, tvOS 26.0, macOS 14.0, macCatalyst 17.0, *)
        public typealias ArrayLiteralElement = AccessibilityComponent.SupportedActions
        
        @available(iOS 17.0, tvOS 26.0, macOS 14.0, macCatalyst 17.0, *)
        public typealias Element = AccessibilityComponent.SupportedActions
        
        @available(iOS 17.0, tvOS 26.0, macOS 14.0, macCatalyst 17.0, *)
        public typealias RawValue = Int
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> AccessibilityComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ component: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAccessibilityElement: Bool
    
    public var label: LocalizedStringResource?
    
    public var value: LocalizedStringResource?
    
    public var customContent: [AccessibilityComponent.CustomContent]
    
    public var systemActions: AccessibilityComponent.SupportedActions
    
    public var customActions: [LocalizedStringResource]
    
    public init() {
        assertUnimplemented()
    }
}
