package import Foundation

package protocol AccessibilityTextAttributeResolver {
    static func resolveDefaultAttributes(_ attributes: inout [NSAttributedString.Key : Any])
    
    static func resolveTextStyleAttributes(_ attributes: inout [NSAttributedString.Key : Any], textStyle: Text.Style, environment: EnvironmentValues)
    
    static func resolveAccessibilitySpeechAttributes(into attributes: inout [NSAttributedString.Key : Any], speechAttr: AccessibilitySpeechAttributes, environment: EnvironmentValues, options: AccessibilityCore.TextResolutionOptions)
}
