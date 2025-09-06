private import FeatureFlags
private import Foundation
private import _DarwinFoundation3._stdlib

package struct GestureContainerFeature {
    package static nonisolated(unsafe) var isEnabled: Bool {
        if let isEnabledOverride {
            return isEnabledOverride
        }
        
        if CoreTesting.isRunning {
            return false
        }
        
        if let envValue {
            return envValue
        }
        
        if let userDefaultsValue {
            return userDefaultsValue
        }
        
        if let bundleValue = GestureContainerFeature.VisionOSFeature.bundleValue {
            return bundleValue
        }
        
        guard isFeatureEnabled(GestureContainerFeature.VisionOSFeature()) else {
            return false
        }
        
        return isLinkedOnOrAfter(.v6)
    }
    
    static nonisolated(unsafe) var isEnabledOverride: Bool? = nil
    
    fileprivate static let userDefaultsValue: Bool? = {
        guard let boolValue = UserDefaults.standard.object(forKey: "com.apple.SwiftUI.GestureContainers") as? Bool else {
            return nil
        }
        
        return boolValue
    }()
    
    fileprivate static let envValue: Bool? = {
        guard let value = getenv("SWIFTUI_GESTURE_CONTAINER") else {
            return nil
        }
        
        return atoi(value) != 0
    }()
}

extension GestureContainerFeature {
    fileprivate struct VisionOSFeature: FeatureFlagsKey {
        var domain: StaticString {
            return "SwiftUI"
        }
        
        var feature: StaticString {
            return "gestureContainersVisionOS"
        }
        
        static let bundleValue: Bool? = {
            guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
                return nil
            }
            
            if bundleIdentifier == "com.apple.mobilenotes" {
                return true
            }
            
            if bundleIdentifier == "com.apple.RealityChrome" {
                return true
            }
            
            if bundleIdentifier == "com.apple.RealityHUD" {
                return true
            }
            
            if bundleIdentifier == "com.apple.RealityLauncher" {
                return true
            }
            
            return nil
        }()
    }
}
