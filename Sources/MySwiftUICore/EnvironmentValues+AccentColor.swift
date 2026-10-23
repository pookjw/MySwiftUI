// AA5C9AAB6528C7C6B599DF55246DE53A

extension EnvironmentValues {
    package var accentColor: Color? {
        get {
            return self[AccentColorKey.self]
        }
        set {
            self[AccentColorKey.self] = newValue
        }
        _modify {
            yield &self[AccentColorKey.self]
        }
    }
    
    package var _accentColor: Color? {
        get {
            return self.accentColor
        }
        set {
            self.accentColor = newValue
        }
        _modify {
            yield &self[AccentColorKey.self]
        }
    }
    
    package var _defaultAccentColor: Color? {
        get {
            if let color = self[DefaultAccentColorKey.self] {
                return color
            }
            guard platformProvidersDefinition.providers.defaultAccentColor == nil else {
                assertUnimplemented()
            }
            return nil
        }
        set {
            self[DefaultAccentColorKey.self] = newValue
        }
    }
}

fileprivate struct DefaultAccentColorKey : EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}

fileprivate struct AccentColorKey : EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}
