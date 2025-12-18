internal import MySwiftUICore

extension EnvironmentValues {
    var ignoreInvertColorsFilterActive: Bool {
        get {
            return self[IgnoreInvertColorsFilterActiveKey.self]
        }
        set {
            self[IgnoreInvertColorsFilterActiveKey.self] = newValue
        }
    }
}

fileprivate struct IgnoreInvertColorsFilterActiveKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
