internal import MySwiftUICore

struct ScenePersistentSystemOverlaysKey: EnvironmentKey {
    static var defaultValue: PersistentSystemOverlaysKey.Overlays {
        return PersistentSystemOverlaysKey.Overlays(visibility: .automatic, isAnimated: false)
    }
}
