internal import MySwiftUICore

extension EnvironmentValues {
    var formRowInfoVisibility: Visibility {
        get {
            return self[FormRowInfoVisibilityKey.self]
        }
        set {
            self[FormRowInfoVisibilityKey.self] = newValue
        }
    }
}

struct FormRowInfoVisibilityKey : EnvironmentKey, _ViewTraitKey {
    static var defaultValue: Visibility {
        return .automatic
    }
}
