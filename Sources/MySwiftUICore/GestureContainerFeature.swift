private import FeatureFlags
private import Foundation
private import _DarwinFoundation3._stdlib

package struct GestureContainerFeature : Feature {
    package init() {}
    
    @safe nonisolated(unsafe) package static var isEnabled: Bool {
        if let isEnabledOverride = isEnabledOverride {
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
        
        return isLinkedOnOrAfter(.v7)
    }
    
    @safe nonisolated(unsafe) static var isEnabledOverride: Bool? = nil
    
    fileprivate static let userDefaultsValue: Bool? = {
        guard UserDefaults.standard.object(forKey: "com.apple.SwiftUI.GestureContainers") != nil else {
            return nil
        }
        
        return UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.GestureContainers")
    }()
    
    fileprivate static let envValue: Bool? = {
        guard let value = unsafe getenv("SWIFTUI_GESTURE_CONTAINER") else {
            return nil
        }
        
        return unsafe atoi(value) != 0
    }()
}

extension GestureContainerFeature {
    fileprivate struct VisionOSFeature : FeatureFlagsKey {
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
                return false
            }
            
            if bundleIdentifier == "com.apple.RealityHUD" {
                return false
            }
            
            if bundleIdentifier == "com.apple.RealityLauncher" {
                return false
            }
            
            return nil
        }()
    }
}
