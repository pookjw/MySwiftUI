internal import MySwiftUICore

extension EnvironmentValues {
    var isInOrnament: Bool {
        get {
            return self[IsInOrnamentKey.self]
        }
        set {
            self[IsInOrnamentKey.self] = newValue
        }
    }
}

fileprivate struct IsInOrnamentKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
