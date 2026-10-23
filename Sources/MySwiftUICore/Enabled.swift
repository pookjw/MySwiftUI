// 09CE35833F3876FE3A3A46977D61FC64

extension EnvironmentValues {
    public var isEnabled: Bool {
        get {
            return self[EnabledKey.self]
        }
        set {
            self[EnabledKey.self] = newValue
        }
        _modify {
            yield &self[EnabledKey.self]
        }
    }
}

fileprivate struct EnabledKey : EnvironmentKey {
    static var defaultValue: Bool {
        return true
    }
}
