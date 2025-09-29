public import CoreGraphics

extension EnvironmentValues {
    public var displayScale: CGFloat {
        get {
            return self[DisplayScaleKey.self]
        }
        set {
            self[DisplayScaleKey.self] = newValue
        }
    }
}

fileprivate struct DisplayScaleKey: EnvironmentKey {
    static var defaultValue: CGFloat {
        return 1
    }
}
