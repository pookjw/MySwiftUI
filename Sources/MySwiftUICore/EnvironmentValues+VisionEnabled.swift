extension EnvironmentValues {
    package var isVisionEnabled: Bool {
        get {
            return self[IsVisionEnabledKey.self]
        }
        set {
            self[IsVisionEnabledKey.self] = newValue
        }
    }
}

struct IsVisionEnabledKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
