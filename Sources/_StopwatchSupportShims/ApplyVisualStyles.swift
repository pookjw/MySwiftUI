private import MySwiftUICore
private import MySwiftUI
private import Foundation
private import os.log

@safe private nonisolated(unsafe) var didAppliedVisualStyles = false

@safe private nonisolated(unsafe) let uiKitDefault: UserDefaults? = {
    if let defaults = UserDefaults(suiteName: "com.apple.UIKit") {
        return defaults
    }
    
    unsafe os_log(.error, log: OSLog.stopwatchSupport, "Failed to load UIKit defaults")
    return nil
}()
@safe private nonisolated(unsafe) let borderedButtonsByDefault = AppStorage(wrappedValue: true, "BorderedButtonsByDefault", store: uiKitDefault)

@safe private nonisolated(unsafe) let blocklist: Set<String> = [
    "com.apple.Mind",
    "com.apple.mobilesafari",
    "com.apple.SafariViewService",
    "com.apple.RealityLauncher",
    "com.apple.RealityControlCenter",
    "com.apple.LocalAuthenticationUIService",
    "com.apple.RealityCoverSheet",
    "com.apple.RealityEnvironment",
    "com.apple.sidecar",
    "com.apple.GenerativePlayground",
    "com.apple.GenerativePlaygroundApp"
]

@safe private nonisolated(unsafe) let implicitButtonStyleSensoryFeedback: Bool = {
    if UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.ImplicitButtonStyleSensoryFeedback_BypassAppCheck") {
        unsafe os_log(.info, log: OSLog.stopwatchSupport, "Implicit ButtonStyle feedback: Bypass app checks default set, enabled.")
        return true
    }
    
    // <+444>
    if
        let infoDictionary = Bundle.main.infoDictionary,
        let boolValue = infoDictionary["SupportsImplicitButtonStyleSensoryFeedback"] as? Bool
    {
        unsafe os_log(.info, log: OSLog.stopwatchSupport, "Implicit ButtonStyle feedback: App explicitly specified support as \(boolValue).")
        return boolValue
    }
    
    // <+824>
    if isLinkedOnOrAfter(.v7) {
        if
            let bundleIdentifier = Bundle.main.bundleIdentifier,
            blocklist.contains(bundleIdentifier)
        {
            unsafe os_log(.info, log: OSLog.stopwatchSupport, "Implicit ButtonStyle feedback: Disabled due to system blocklist.")
            return false
        } else {
            unsafe os_log(.info, log: OSLog.stopwatchSupport, "Implicit ButtonStyle feedback: Passed app checks, enabled.")
            return true
        }
    } else {
        unsafe os_log(.info, log: OSLog.stopwatchSupport, "Implicit ButtonStyle feedback: Disabled due to old SDK version.")
        return false
    }
}()

func applyVisualStyles() {
    guard !didAppliedVisualStyles else {
        return
    }
    
    _applyVisualStyles()
    didAppliedVisualStyles = true
}

private func _applyVisualStyles() {
    // <+236>
    var overrides = ViewStyleOverrides()
    overrides.registerDefaultToggleStyleType(_StopwatchSupportShims.ToggleStyle.self)
    
    // <+356>
    overrides.registerStyleOverride(_StopwatchSupportShims.ToggleStyle.self, for: SwitchToggleStyle.self)
    
    // <+548>
    if borderedButtonsByDefault.wrappedValue {
        overrides.registerDefaultButtonStyleType(SWSBorderedButtonStyle.self)
    } else {
        overrides.registerDefaultButtonStyleType(SWSBorderlessButtonStyle.self)
    }
    
    // <+696>
    overrides.registerStyleOverride(SWSBorderlessButtonStyle.self, for: BorderlessButtonStyle.self)
    // <+856>
    overrides.registerStyleOverride(SWSBorderedButtonStyle.self, for: BorderedButtonStyle.self)
    // <+956>
    overrides.registerStyleOverride(_StopwatchSupportShims.LinkButtonStyle.self, for: RealityLinkButtonStyle.self)
    // <+1068>
    overrides.registerStyleOverride(SWSBorderedButtonStyle.self, for: BorderedProminentButtonStyle.self)
    // <+1220>
    overrides.registerStyleOverride(SWSPlainButtonStyle.self, for: PlainButtonStyle.self)
    
    // <+1240>
    if implicitButtonStyleSensoryFeedback {
        // <+1352>
        overrides.registerDefaultButtonBehaviorStyleType(SWSButtonBehaviorStyle.self)
    }
    
    // <+1460>
    overrides.registerDefaultSliderStyleType(_StopwatchSupportShims.SliderStyle.self)
    // <+1608>
    overrides.registerDefaultStepperStyleType(_StopwatchSupportShims.StepperStyle.self)
    // <+1888>
    overrides.registerDefaultGroupBoxStyleType(_StopwatchSupportShims.GroupBoxStyle.self)
    // <+4528>
    overrides.registerDefaultHelpStyleType(RealityHelpStyle.self)
    
    // <+5052>
    ViewStyleRegistry.registerOverrides(overrides, for: .vision)
}
