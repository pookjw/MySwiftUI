
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
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

fileprivate struct AccessibilityInvertColorsKey: EnvironmentKey {
    static var defaultValue: Bool? {
        return nil
    }
}
