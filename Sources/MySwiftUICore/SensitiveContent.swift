// 7799685610985DBA9248562F2E4D5E6E

extension EnvironmentValues {
    var sensitiveContent: Bool {
        get {
            return self[SensitiveContentKey.self]
        }
        set {
            self[SensitiveContentKey.self] = newValue
        }
    }
}

fileprivate struct SensitiveContentKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
