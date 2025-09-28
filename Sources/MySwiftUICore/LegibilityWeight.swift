public enum LegibilityWeight: Hashable, Sendable {
    case regular
    case bold
}

extension EnvironmentValues {
    public var legibilityWeight: LegibilityWeight? {
        get {
            return self[LegibilityWeightKey.self]
        }
        set {
            self[LegibilityWeightKey.self] = newValue
        }
    }
}

fileprivate struct LegibilityWeightKey: EnvironmentKey {
    static var defaultValue: LegibilityWeight? {
        return nil
    }
}
