private import ObjectiveC

package struct AccessibilityAttachment : Equatable {
    package static func properties(_: AccessibilityProperties) -> AccessibilityAttachment {
        assertUnimplemented()
    }
    
    private var properties: AccessibilityProperties
    private var platformElement: NSObject & PlatformAccessibilityElementProtocol
    
    package init() {
        assertUnimplemented()
    }
    
    package static func == (lhs: AccessibilityAttachment, rhs: AccessibilityAttachment) -> Bool {
        assertUnimplemented()
    }
}
