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
}

fileprivate struct SystemColorSchemeKey: EnvironmentKey {
    static var defaultValue: ColorScheme {
        return .light
    }
}
