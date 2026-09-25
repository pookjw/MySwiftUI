internal import MySwiftUICore

extension EnvironmentValues {
    var formRowAccessoryVisibility: Visibility {
        get {
            return self[FormRowAccessoryVisibilityKey.self]
        }
        set {
            self[FormRowAccessoryVisibilityKey.self] = newValue
        }
    }
}

struct FormRowAccessoryVisibilityKey : EnvironmentKey, _ViewTraitKey {
    static var defaultValue: Visibility {
        return .automatic
    }
}
