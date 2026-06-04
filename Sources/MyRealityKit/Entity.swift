public import CoreGraphics
public import Foundation
public import UIKit

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension Entity.ConfigurationCatalog {
    public init(from url: URL) async throws {
        assertUnimplemented()
    }
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var accessibilityLabelKey: LocalizedStringResource? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var accessibilityValue: LocalizedStringResource? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    @MainActor @preconcurrency public var accessibilityTraits: UIAccessibilityTraits {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var accessibilityCustomContent: [AccessibilityComponent.CustomContent] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macCatalyst 17.0, *)
    @available(macOS, unavailable)
    @MainActor @preconcurrency public var accessibilityCustomRotors: [AccessibilityComponent.RotorType] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var accessibilitySystemActions: AccessibilityComponent.SupportedActions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var accessibilityCustomActions: [LocalizedStringResource] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func __accessibilityWrappers(rootEntityWrapper: __EntityAccessibilityWrapper? = nil) -> [__EntityAccessibilityWrapper] {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable)
    @MainActor @preconcurrency public func __calculateScreenBoundingRect(in arView: ARView) -> CGRect {
        assertUnimplemented()
    }
}
