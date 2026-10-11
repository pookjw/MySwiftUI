// 79BADF4A1DAAA1CD480AFBF6598504A8

extension EnvironmentValues {
    var isBackgroundOpaque: Bool {
        get {
            if self.isVisionEnabled {
                return self[OpaqueBackgroundKey.self]
            } else {
                return true
            }
        }
        set {
            self[OpaqueBackgroundKey.self] = newValue
        }
    }
}

fileprivate struct OpaqueBackgroundKey : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
