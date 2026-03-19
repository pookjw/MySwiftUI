internal import MySwiftUICore
internal import UIKit

final class _UISecureHostingController<Content: View>: UIHostingController<Content> {
    override init(rootView: Content) {
        assertUnimplemented()
    }
    
    @MainActor public dynamic required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
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
