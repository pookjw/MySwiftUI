internal import ObjectiveC

package struct AccessibilityAttachment : Equatable {
    package static func properties(_ properties: AccessibilityProperties) -> AccessibilityAttachment {
        return AccessibilityAttachment(properties: properties)
    }
    
    var properties = AccessibilityProperties()
    var platformElement: (NSObject & PlatformAccessibilityElementProtocol)? = nil
    
    package init() {
    }
    
    init(
        properties: AccessibilityProperties,
        platformElement: (NSObject & PlatformAccessibilityElementProtocol)?
    ) {
        self.properties = properties
        self.platformElement = platformElement
    }
    
    init(properties: AccessibilityProperties) {
        self.properties = properties
    }
    
    var isEmpty: Bool {
        assertUnimplemented()
    }
    
    package static func == (lhs: AccessibilityAttachment, rhs: AccessibilityAttachment) -> Bool {
        assertUnimplemented()
    }
}
