// BA61BB07629D532149CADBB7B4434E7E
internal import CoreGraphics
internal import MySwiftUICore

extension EnvironmentValues {
    var defaultLabelIconToTitleSpacing: CGFloat? {
        get {
            return self[DefaultLabelIconToTitleSpacingKey.self]
        }
        set {
            self[DefaultLabelIconToTitleSpacingKey.self] = newValue
        }
    }
}

fileprivate struct DefaultLabelIconToTitleSpacingKey : EnvironmentKey {
    static var defaultValue: CGFloat? {
        return nil
    }
}
