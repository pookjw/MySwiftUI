internal import MySwiftUICore

final class _UISecureHostingController<Content: View>: UIHostingController<Content> {
    // TODO
}

extension EnvironmentValues {
    var sceneAllowsSecureDrawing: Bool {
        return self[SceneAllowsSecureDrawingKey.self]
    }
}

struct SceneAllowsSecureDrawingKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
