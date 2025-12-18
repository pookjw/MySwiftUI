
extension EnvironmentValues {
    public private(set) var accessibilityInvertColors: Bool {
        get {
            return self[AccessibilityInvertColorsKey.self] == true
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
