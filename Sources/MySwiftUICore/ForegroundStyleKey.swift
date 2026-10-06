// BEFE9363F68E039B4AB6422B8AA4535A

extension EnvironmentValues {
    var foregroundStyle: AnyShapeStyle? {
        get {
            return self[ForegroundStyleKey.self]
        }
        set {
            self[ForegroundStyleKey.self] = newValue
        }
    }
    
    package var defaultForegroundStyle: AnyShapeStyle? {
        get {
            return self[DefaultForegroundStyleKey.self]
        }
        set {
            self[DefaultForegroundStyleKey.self] = newValue
        }
    }
    
    var currentForegroundStyle: AnyShapeStyle? {
        assertUnimplemented()
    }
}

fileprivate struct ForegroundStyleKey : EnvironmentKey {
    static var defaultValue: AnyShapeStyle? {
        return nil
    }
}

fileprivate struct DefaultForegroundStyleKey : EnvironmentKey {
    static var defaultValue: AnyShapeStyle? {
        return nil
    }
}
