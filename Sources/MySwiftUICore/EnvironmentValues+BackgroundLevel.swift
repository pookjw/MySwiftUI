extension EnvironmentValues {
    package var backgroundLevel: Int {
        get {
            return self[BackgroundInfoKey.self]
        }
        set {
            self[BackgroundInfoKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundInfoKey: EnvironmentKey {
    static let defaultValue: Int = 0
}
