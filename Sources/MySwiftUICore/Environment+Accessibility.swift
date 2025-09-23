#warning("TODO")

extension EnvironmentValues {
    public private(set) var accessibilityInvertColors: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    public var _accessibilityInvertColors: Bool {
        get {
            return accessibilityInvertColors
        }
        set {
            accessibilityInvertColors = newValue
        }
    }
}
