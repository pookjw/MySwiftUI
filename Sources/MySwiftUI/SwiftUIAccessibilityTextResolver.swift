internal import MySwiftUICore
internal import Foundation

struct SwiftUIAccessibilityTextResolver : AccessibilityTextAttributeResolver {
    static func resolveDefaultAttributes(_ attributes: inout [NSAttributedString.Key : Any]) {
        assertUnimplemented()
    }

    static func resolveTextStyleAttributes(_ attributes: inout [NSAttributedString.Key : Any], textStyle: Text.Style, environment: EnvironmentValues) {
        assertUnimplemented()
    }

    static func resolveAccessibilitySpeechAttributes(into attributes: inout [NSAttributedString.Key : Any], speechAttr: AccessibilitySpeechAttributes, environment: EnvironmentValues, options: AccessibilityCore.TextResolutionOptions) {
        assertUnimplemented()
    }
}
