internal import MySwiftUICore

extension EnvironmentValues {
    var formInsets: OptionalEdgeInsets {
        get {
            return self[FormInsetsKey.self]
        }
        set {
            self[FormInsetsKey.self] = newValue
        }
    }
}

struct FormInsetsKey : EnvironmentKey {
    static let defaultValue = OptionalEdgeInsets()
}
