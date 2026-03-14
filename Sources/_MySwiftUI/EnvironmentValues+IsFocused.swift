internal import MySwiftUICore

extension EnvironmentValues {
    var isFocused: Bool {
        get {
            return self[IsFocusedKey.self]
        }
        set {
            self[IsFocusedKey.self] = newValue
        }
    }
    
    var isPlatformFocusSystemEnabled: Bool {
        get {
            return self[IsPlatformFocusSystemEnabled.self]
        }
        set {
            return self[IsPlatformFocusSystemEnabled.self] = newValue
        }
    }
    
    fileprivate struct IsFocusedKey: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
    
    fileprivate struct IsPlatformFocusSystemEnabled: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
