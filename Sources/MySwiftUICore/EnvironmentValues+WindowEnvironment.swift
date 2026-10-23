extension EnvironmentValues {
    package var windowAppearsFocused: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsFocused.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsFocused.self] = newValue
        }
        _modify {
            yield &self[WindowEnvironmentKeys.AppearsFocused.self]
        }
    }
    
    package var windowAppearsMain: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsMain.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsMain.self] = newValue
        }
        _modify {
            yield &self[WindowEnvironmentKeys.AppearsMain.self]
        }
    }
    
    package var windowAppearsActive: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsActive.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsActive.self] = newValue
        }
        _modify {
            yield &self[WindowEnvironmentKeys.AppearsActive.self]
        }
    }
    
    package var windowIsFocused: Bool {
        get {
            return self[WindowEnvironmentKeys.IsFocused.self]
        }
        set {
            self[WindowEnvironmentKeys.IsFocused.self] = newValue
        }
        _modify {
            yield &self[WindowEnvironmentKeys.IsFocused.self]
        }
    }
    
    package var windowIsMain: Bool {
        get {
            return self[WindowEnvironmentKeys.IsMain.self]
        }
        set {
            self[WindowEnvironmentKeys.IsMain.self] = newValue
        }
        _modify {
            yield &self[WindowEnvironmentKeys.IsMain.self]
        }
    }
}

enum WindowEnvironmentKeys {
    struct AppearsFocused : EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct AppearsMain : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
    
    struct AppearsActive : EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct IsFocused : EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct IsMain : EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
}
