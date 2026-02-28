// AA5C9AAB6528C7C6B599DF55246DE53A

extension EnvironmentValues {
    package var accentColor: Color? {
        get {
            return self[AccentColorKey.self]
        }
        set {
            self[AccentColorKey.self] = newValue
        }
    }
    
    package var _accentColor: Color? {
        get {
            return self[AccentColorKey.self]
        }
        set {
            self[AccentColorKey.self] = newValue
        }
    }
    
    package var _defaultAccentColor: Color? {
        get {
            return self[DefaultAccentColorKey.self]
        }
        set {
            self[DefaultAccentColorKey.self] = newValue
        }
    }
}

fileprivate struct DefaultAccentColorKey: EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}

fileprivate struct AccentColorKey: EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}
