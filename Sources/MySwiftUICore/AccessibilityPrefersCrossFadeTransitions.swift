// 1E80A5D8CD82563C298D64AC1337E839

extension EnvironmentValues {
    var accessibilityPrefersCrossFadeTransitions: Bool {
        get {
            if let value = self[AccessibilityPrefersCrossFadeTransitionsKey.self] {
                return value
            }
            
            return accessibilitySettingEnabled(.prefersCrossFadeTransitions)
        }
        set {
            self[AccessibilityPrefersCrossFadeTransitionsKey.self] = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    func accessibilitySettingEnabled(_ setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        fatalError("TODO")
    }
}

fileprivate struct AccessibilityPrefersCrossFadeTransitionsKey: EnvironmentKey {
    static var defaultValue: Bool? {
        return nil
    }
}
