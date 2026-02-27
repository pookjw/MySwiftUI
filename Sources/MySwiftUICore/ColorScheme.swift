
public enum ColorScheme {
    case light
    case dark
}

extension EnvironmentValues {
    package var systemColorScheme: ColorScheme {
        get {
            return self[SystemColorSchemeKey.self]
        }
        set {
            self[SystemColorSchemeKey.self] = newValue
        }
    }
    
    package var explicitPreferredColorScheme: ColorScheme? {
        get {
            return self[ExplicitPreferredColorSchemeKey.self]
        }
        set {
            self[ExplicitPreferredColorSchemeKey.self] = newValue 
        }
    }
    
    package var glassColorScheme: ColorScheme? {
        get {
            return self[ExplicitPreferredColorSchemeKey.self]
        }
        set {
            self[ExplicitPreferredColorSchemeKey.self] = newValue 
        }
    }
    
    public var colorScheme: ColorScheme {
        get {
            return self[ExplicitColorSchemeKey.self] ?? self[PlatformColorSchemeKey.self] ?? .light
        }
        set {
            self[ExplicitColorSchemeKey.self] = newValue
        }
    }
    
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

public enum ColorSchemeContrast: CaseIterable, Sendable {
    case standard
    case increased
}

fileprivate struct ColorSchemeContrastKey: EnvironmentKey {
    static var defaultValue: ColorSchemeContrast {
        return .standard
    }
}

fileprivate struct SystemColorSchemeKey: EnvironmentKey {
    static var defaultValue: ColorScheme {
        return .light
    }
}

fileprivate struct ExplicitPreferredColorSchemeKey: EnvironmentKey {
    static var defaultValue: ColorScheme? {
        return nil
    }
}

fileprivate struct ExplicitColorSchemeKey: EnvironmentKey {
    static var defaultValue: ColorScheme? {
        return nil
    }
}

fileprivate struct PlatformColorSchemeKey: EnvironmentKey {
    static var defaultValue: ColorScheme? {
        return nil
    }
}
