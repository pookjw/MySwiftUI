internal import Foundation
internal import MySwiftUICore
internal import AttributeGraph

struct AccessibilityFocus {
    @discardableResult
    static func changed(from: (NSObject & PlatformAccessibilityElementProtocol)?, to: (NSObject & PlatformAccessibilityElementProtocol)?, within: ViewRendererHost) -> Bool {
        fatalError("TODO")
    }
}

extension _GraphInputs {
    // 원래 없음
    var accessibilityFocus: OptionalAttribute<AccessibilityFocus> {
        get {
            return self[AccessibilityFocusInputKey.self]
        }
        set {
            self[AccessibilityFocusInputKey.self] = newValue
        }
        _modify {
            yield &self[AccessibilityFocusInputKey.self]
        }
    }
}

fileprivate struct AccessibilityFocusInputKey: ViewInput {
    static var defaultValue: OptionalAttribute<AccessibilityFocus> {
        return OptionalAttribute()
    }
}
