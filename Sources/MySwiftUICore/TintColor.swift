// EB037BD7690CB8A700384AACA7B075E4

extension EnvironmentValues {
    package var effectiveTintColor: Color? {
        get {
            if let tintColor = self[TintKey.self] {
                return tintColor.fallbackColor(in: self, level: 0)
            }
            
            return self.accentColor
        }
    }
}

fileprivate struct TintKey: EnvironmentKey {
    static var defaultValue: Color? {
        return nil
    }
}

extension ShapeStyle {
    func fallbackColor(in environmentValues: EnvironmentValues, level: Int) -> Color? {
        fatalError("TODO")
    }
}
