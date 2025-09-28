public enum ColorSchemeContrast: CaseIterable, Sendable {
    case standard
    case increased
}

extension EnvironmentValues {
    public var colorSchemeContrast: ColorSchemeContrast {
        return self[ColorSchemeContrastKey.self]
    }
    
    public var _colorSchemeContrast: ColorSchemeContrast {
        get {
            return colorSchemeContrast
        }
        set {
            self[ColorSchemeContrastKey.self] = newValue
        }
    }
}

fileprivate struct ColorSchemeContrastKey: EnvironmentKey {
    static var defaultValue: ColorSchemeContrast {
        return .standard
    }
}
