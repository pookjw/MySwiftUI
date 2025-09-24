internal import MySwiftUICore

extension EnvironmentValues {
    var requestAccessibilityFocus: AccessibilityRequestFocusAction {
        get {
            return self[AccessibilityRequestFocusKey.self]
        }
        set {
            self[AccessibilityRequestFocusKey.self]
        }
    }
}

struct AccessibilityRequestFocusAction {
    var onAccessibilityFocus: ((AnyHashable, Namespace.ID) -> Void)?
}

fileprivate struct AccessibilityRequestFocusKey: EnvironmentKey {
    static var defaultValue: AccessibilityRequestFocusAction {
        return AccessibilityRequestFocusAction(onAccessibilityFocus: nil)
    }
}
