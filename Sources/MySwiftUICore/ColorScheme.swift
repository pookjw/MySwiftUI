#warning("TODO")

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
