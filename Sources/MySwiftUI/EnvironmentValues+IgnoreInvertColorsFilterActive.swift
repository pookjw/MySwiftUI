// 8F7EEC29F2C13A367344344FB59228B4
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

fileprivate struct IgnoreInvertColorsFilterActiveKey : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
