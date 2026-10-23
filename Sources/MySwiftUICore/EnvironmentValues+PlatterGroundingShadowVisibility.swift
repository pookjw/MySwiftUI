extension EnvironmentValues {
    package var platterGroundingShadowVisibility: Visibility {
        get {
            return self[PlatterGroundingShadowVisibilityKey.self]
        }
        set {
            self[PlatterGroundingShadowVisibilityKey.self] = newValue
        }
        _modify {
            yield &self[PlatterGroundingShadowVisibilityKey.self]
        }
    }
}

fileprivate struct PlatterGroundingShadowVisibilityKey : EnvironmentKey {
    static var defaultValue: Visibility {
        return .automatic
    }
}
