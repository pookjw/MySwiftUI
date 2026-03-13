// 18671928047E57F039DC339288B6FAFB

extension EnvironmentValues {
    @inline(__always)
    var shouldRedactContent: Bool {
        get {
            return self[ShouldRedactContentKey.self]
        }
        set {
            self[ShouldRedactContentKey.self] = newValue
        }
    }
    
    fileprivate struct ShouldRedactContentKey: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
