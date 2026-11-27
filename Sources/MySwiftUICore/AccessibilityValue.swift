internal import Foundation

protocol AccessibilityPlatformSafe {
}

extension Bool : AccessibilityPlatformSafe {
}

extension Int : AccessibilityPlatformSafe {
}

extension Double : AccessibilityPlatformSafe {
}

extension String : AccessibilityPlatformSafe {
}

extension NSNumber : AccessibilityPlatformSafe {
}

protocol AccessibilityValue {
    associatedtype PlatformValue : AccessibilityPlatformSafe
    
    static var type: AnyAccessibilityValueType { get }
    var value: Self.PlatformValue { get }
    var displayDescription: String? { get }
    var localizedDescription: String? { get }
    var step: Self.PlatformValue? { get }
    var minValue: Self.PlatformValue? { get }
    var maxValue: Self.PlatformValue? { get }
}

extension AccessibilityValue {
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
    
    var step: Self.PlatformValue? {
        assertUnimplemented()
    }
    
    var minValue: Self.PlatformValue? {
        assertUnimplemented()
    }
    
    var maxValue: Self.PlatformValue? {
        assertUnimplemented()
    }
}

extension AccessibilityValue where Self.PlatformValue == Self {
    var value: Self {
        assertUnimplemented()
    }
}

extension AccessibilityValue where Self : RawRepresentable {
    var value: Self.RawValue {
        assertUnimplemented()
    }
}

extension AccessibilityValue where Self.PlatformValue == NSNumber {
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
    
    var localizedNumericDescription: String? {
        assertUnimplemented()
    }
}

extension AccessibilityValue where Self.PlatformValue : CustomStringConvertible {
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
}

extension Bool : AccessibilityValue {
    typealias PlatformValue = Bool

    static var type: AnyAccessibilityValueType {
        assertUnimplemented()
    }
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
}

extension Int : AccessibilityValue {
    typealias PlatformValue = Int

    static var type: AnyAccessibilityValueType {
        assertUnimplemented()
    }
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
}

extension Double : AccessibilityValue {
    typealias PlatformValue = Double

    static var type: AnyAccessibilityValueType {
        assertUnimplemented()
    }
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
}

extension String : AccessibilityValue {
    typealias PlatformValue = String

    static var type: AnyAccessibilityValueType {
        assertUnimplemented()
    }
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
}
