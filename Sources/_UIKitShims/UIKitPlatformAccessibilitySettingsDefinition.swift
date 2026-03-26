@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import UIKit
private import Accessibility
private import _AccessibilityPrivate

final class UIKitPlatformAccessibilitySettingsDefinition: PlatformAccessibilitySettingsDefinition {
    @preconcurrency
    override func currentValue(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        switch setting {
        case .differentiateWithoutColors:
            return unsafe UIAccessibility.shouldDifferentiateWithoutColor
        case .reduceTransparency:
            return unsafe UIAccessibility.isReduceTransparencyEnabled
        case .reduceMotion:
            return unsafe UIAccessibility.isReduceMotionEnabled
        case .prefersCrossFadeTransitions:
            return unsafe UIAccessibility.prefersCrossFadeTransitions
        case .invertColors:
            return unsafe UIAccessibility.isInvertColorsEnabled
        case .boldText:
            return unsafe UIAccessibility.isBoldTextEnabled
        case .buttonShapes:
            return unsafe UIAccessibility.buttonShapesEnabled
        case .dimFlashingLights:
            return unsafe AccessibilitySettings._isPhotosensitiveMitigationEnabled
        case .playAnimatedImages:
            return unsafe AccessibilitySettings.animatedImagesEnabled
        case .headAnchorAlternative:
            return unsafe AccessibilitySettings.prefersHeadAnchorAlternative
        case .increaseFocusState:
            return unsafe AccessibilitySettings._isHighContrastFocusIndicatorsEnabled
        case .reduceHoverReveal:
#if os(visionOS)
            return false
#else
#error("TODO")
#endif
        case .onOffLabels:
            return unsafe AccessibilitySettings._isIncreaseButtonLegibility
        case .quickActions:
#if os(visionOS)
            return false
#else
#error("TODO")
#endif
        case .largeContentViewer:
            return UILargeContentViewerInteraction.isEnabled
        case .voiceOver:
            return unsafe UIAccessibility.isVoiceOverRunning
        case .switchControl:
            return unsafe UIAccessibility.isSwitchControlRunning
        case .fullKeyboardAccess:
            return unsafe AccessibilitySettings._isFullKeyboardAccessEnabled
        case .voiceControl:
            return unsafe AccessibilitySettings._isCommandAndControlEnabled
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
    
    @preconcurrency
    override func notification(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Notification.Name? {
        switch setting {
        case .differentiateWithoutColors:
            return unsafe UIAccessibility.differentiateWithoutColorDidChangeNotification
        case .reduceTransparency:
            return unsafe UIAccessibility.reduceTransparencyStatusDidChangeNotification
        case .reduceMotion:
            return unsafe UIAccessibility.reduceMotionStatusDidChangeNotification
        case .prefersCrossFadeTransitions:
            return unsafe UIAccessibility.prefersCrossFadeTransitionsStatusDidChange
        case .invertColors:
            return unsafe UIAccessibility.invertColorsStatusDidChangeNotification
        case .boldText:
            return unsafe UIAccessibility.boldTextStatusDidChangeNotification
        case .buttonShapes:
            return unsafe UIAccessibility.buttonShapesEnabledStatusDidChangeNotification
        case .dimFlashingLights:
            return unsafe AccessibilitySettings._photosensitiveMitigationEnabledDidChangeNotification
        case .playAnimatedImages:
            return unsafe AccessibilitySettings.animatedImagesEnabledDidChangeNotification
        case .headAnchorAlternative:
            return unsafe AccessibilitySettings.prefersHeadAnchorAlternativeDidChangeNotification
        case .increaseFocusState:
            return unsafe AccessibilitySettings._highContrastFocusIndicatorsEnabledDidChangeNotification
        case .reduceHoverReveal:
#if os(visionOS)
            return nil
#else
#error("TODO")
#endif
        case .onOffLabels:
            return unsafe AccessibilitySettings._increaseButtonLegibilityDidChangeNotification
        case .quickActions:
#if os(visionOS)
            return nil
#else
#error("TODO")
#endif
        case .largeContentViewer:
            return UILargeContentViewerInteraction.enabledStatusDidChangeNotification
        case .voiceOver:
            return unsafe UIAccessibility.voiceOverStatusDidChangeNotification
        case .switchControl:
            return unsafe UIAccessibility.switchControlStatusDidChangeNotification
        case .fullKeyboardAccess:
            return unsafe AccessibilitySettings._fullKeyboardAccessEnabledDidChangeNotification
        case .voiceControl:
            return unsafe AccessibilitySettings._commandAndControlEnabledDidChangeNotification
        case .hoverText:
            return unsafe AccessibilitySettings._hoverTextEnabledNotification
        @unknown default:
            return nil
        }
    }
    
    // TODO
}
