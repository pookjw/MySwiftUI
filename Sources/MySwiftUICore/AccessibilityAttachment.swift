#warning("TODO")
private import ObjectiveC

package struct AccessibilityAttachment: Equatable {
    private var properties: AccessibilityProperties
    private var platformElement: NSObject & PlatformAccessibilityElementProtocol
    
    package init() {
        fatalError("TODO")
    }
    
    package static func == (lhs: AccessibilityAttachment, rhs: AccessibilityAttachment) -> Bool {
        fatalError("TODO")
    }
}
