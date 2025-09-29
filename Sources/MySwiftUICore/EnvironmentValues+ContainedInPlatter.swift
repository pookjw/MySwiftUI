extension EnvironmentValues {
    package var isContainedInPlatter: Bool {
        get {
            return self[IsPlatterPresentKey.self]
        }
        set {
            self[IsPlatterPresentKey.self] = newValue
        }
    }
}

fileprivate struct IsPlatterPresentKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
