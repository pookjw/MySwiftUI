package import CoreGraphics

extension EnvironmentValues {
    package var displayCornerRadius: CGFloat? {
        get {
            return self[DisplayCornerRadiusKey.self]
        }
        set {
            self[DisplayCornerRadiusKey.self] = newValue
        }
    }
}

fileprivate struct DisplayCornerRadiusKey: EnvironmentKey {
    static var defaultValue: CGFloat? {
        return nil
    }
}
