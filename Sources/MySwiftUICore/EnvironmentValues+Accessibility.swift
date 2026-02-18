// 1E80A5D8CD82563C298D64AC1337E839

extension EnvironmentValues {
    public private(set) var accessibilityInvertColors: Bool {
        get {
            if let value = self[AccessibilityInvertColorsKey.self] {
                return value
            }
            
            return accessibilitySettingEnabled(.invertColors)
        }
        set {
            self[AccessibilityInvertColorsKey.self] = newValue
        }
    }
    
    public var _accessibilityInvertColors: Bool {
        get {
            return accessibilityInvertColors
        }
        set {
            accessibilityInvertColors = newValue
        }
    }
    
    public var accessibilityEnabled: Bool {
        get {
            return self[AccessibilityEnabledKey.self]
        }
        set {
            self[AccessibilityEnabledKey.self] = newValue
        }
    }
}

fileprivate struct AccessibilityInvertColorsKey: EnvironmentKey {
    static var defaultValue: Bool? {
        return nil
    }
}

fileprivate struct AccessibilityEnabledKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
