// EB037BD7690CB8A700384AACA7B075E4

extension EnvironmentValues {
    package var effectiveTintColor: Color? {
        get {
            if let tintColor = self[TintKey.self],
               let color = tintColor.fallbackColor(in: self, level: 0) {
                return color
            }
            
            return self.accentColor
        }
    }
}

fileprivate struct TintKey : EnvironmentKey {
    static var defaultValue: AnyShapeStyle? {
        return nil
    }
}

extension ShapeStyle {
    func fallbackColor(in environmentValues: EnvironmentValues, level: Int) -> Color? {
        assertUnimplemented()
    }
}
