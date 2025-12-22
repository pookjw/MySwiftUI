@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import UIKit
private import Accessibility
private import _AccessibilityPrivate

final class UIKitPlatformAccessibilitySettingsDefinition: PlatformAccessibilitySettingsDefinition {
    override func currentValue(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        switch setting {
        case .differentiateWithoutColors:
            return UIAccessibility.shouldDifferentiateWithoutColor
        case .reduceTransparency:
            return UIAccessibility.isReduceTransparencyEnabled
        case .reduceMotion:
            return UIAccessibility.isReduceMotionEnabled
        case .prefersCrossFadeTransitions:
            return UIAccessibility.prefersCrossFadeTransitions
        case .invertColors:
            return UIAccessibility.isInvertColorsEnabled
        case .boldText:
            return UIAccessibility.isBoldTextEnabled
        case .buttonShapes:
            return UIAccessibility.buttonShapesEnabled
        case .dimFlashingLights:
            return AccessibilitySettings._isPhotosensitiveMitigationEnabled
        case .playAnimatedImages:
            return AccessibilitySettings.animatedImagesEnabled
        case .headAnchorAlternative:
            return AccessibilitySettings.prefersHeadAnchorAlternative
        case .increaseFocusState:
            return AccessibilitySettings._isHighContrastFocusIndicatorsEnabled
        case .reduceHoverReveal:
#if os(visionOS)
            return false
#else
#error("TODO")
#endif
        case .onOffLabels:
            return AccessibilitySettings._isIncreaseButtonLegibility
        case .quickActions:
#if os(visionOS)
            return false
#else
#error("TODO")
#endif
        case .largeContentViewer:
            return UILargeContentViewerInteraction.isEnabled
        case .voiceOver:
            return UIAccessibility.isVoiceOverRunning
        case .switchControl:
            return UIAccessibility.isSwitchControlRunning
        case .fullKeyboardAccess:
            return AccessibilitySettings._isFullKeyboardAccessEnabled
        case .voiceControl:
            return AccessibilitySettings._isCommandAndControlEnabled
        case .hoverText:
#if os(visionOS)
            return false
#else
#error("TODO")
#endif
        @unknown default:
            return false
        }
    }
    
    override func notification(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Notification.Name? {
        switch setting {
        case .differentiateWithoutColors:
            return UIAccessibility.differentiateWithoutColorDidChangeNotification
        case .reduceTransparency:
            return UIAccessibility.reduceTransparencyStatusDidChangeNotification
        case .reduceMotion:
            return UIAccessibility.reduceMotionStatusDidChangeNotification
        case .prefersCrossFadeTransitions:
            return UIAccessibility.prefersCrossFadeTransitionsStatusDidChange
        case .invertColors:
            return UIAccessibility.invertColorsStatusDidChangeNotification
        case .boldText:
            return UIAccessibility.boldTextStatusDidChangeNotification
        case .buttonShapes:
            return UIAccessibility.buttonShapesEnabledStatusDidChangeNotification
        case .dimFlashingLights:
            return AccessibilitySettings._photosensitiveMitigationEnabledDidChangeNotification
        case .playAnimatedImages:
            return AccessibilitySettings.animatedImagesEnabledDidChangeNotification
        case .headAnchorAlternative:
            return AccessibilitySettings.prefersHeadAnchorAlternativeDidChangeNotification
        case .increaseFocusState:
            return AccessibilitySettings._highContrastFocusIndicatorsEnabledDidChangeNotification
        case .reduceHoverReveal:
#if os(visionOS)
            return nil
#else
#error("TODO")
#endif
        case .onOffLabels:
            return AccessibilitySettings._increaseButtonLegibilityDidChangeNotification
        case .quickActions:
#if os(visionOS)
            return nil
#else
#error("TODO")
#endif
        case .largeContentViewer:
            return UILargeContentViewerInteraction.enabledStatusDidChangeNotification
        case .voiceOver:
            return UIAccessibility.voiceOverStatusDidChangeNotification
        case .switchControl:
            return UIAccessibility.switchControlStatusDidChangeNotification
        case .fullKeyboardAccess:
            return AccessibilitySettings._fullKeyboardAccessEnabledDidChangeNotification
        case .voiceControl:
            return AccessibilitySettings._commandAndControlEnabledDidChangeNotification
        case .hoverText:
            return AccessibilitySettings._hoverTextEnabledNotification
        @unknown default:
            return nil
        }
    }
    
    // TODO
}
