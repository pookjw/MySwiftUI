extension EnvironmentValues {
    package var windowAppearsFocused: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsFocused.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsFocused.self] = newValue
        }
    }
    
    package var windowAppearsMain: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsMain.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsMain.self] = newValue
        }
    }
    
    package var windowAppearsActive: Bool {
        get {
            return self[WindowEnvironmentKeys.AppearsActive.self]
        }
        set {
            self[WindowEnvironmentKeys.AppearsActive.self] = newValue
        }
    }
    
    package var windowIsFocused: Bool {
        get {
            return self[WindowEnvironmentKeys.IsFocused.self]
        }
        set {
            self[WindowEnvironmentKeys.IsFocused.self] = newValue
        }
    }
    
    package var windowIsMain: Bool {
        get {
            return self[WindowEnvironmentKeys.IsMain.self]
        }
        set {
            self[WindowEnvironmentKeys.IsMain.self] = newValue
        }
    }
}

enum WindowEnvironmentKeys {
    struct AppearsFocused: EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct AppearsMain: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
    
    struct AppearsActive: EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct IsFocused: EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    struct IsMain: EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
}
