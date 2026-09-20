// 8A4EB52FB1AAB7E2973A8AE4B2C37BB3
internal import MySwiftUICore

extension EnvironmentValues {
    var menuIndicatorProminenceReduced: Bool {
        get {
            return self[ReducedMenuIndicatorProminence.self]
        }
        set {
            self[ReducedMenuIndicatorProminence.self] = newValue
        }
    }
}

fileprivate struct ReducedMenuIndicatorProminence : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
