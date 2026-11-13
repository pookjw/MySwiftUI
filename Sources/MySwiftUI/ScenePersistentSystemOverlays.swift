internal import MySwiftUICore

struct ScenePersistentSystemOverlaysKey : EnvironmentKey {
    static var defaultValue: Visibility {
        return .automatic
    }
}
