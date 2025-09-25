internal import MySwiftUICore
internal import RealityKit

extension EnvironmentValues {
    var realityScene: WeakBox<RealityKit.Scene> {
        get {
            return self[RealitySceneKey.self]
        }
        set {
            self[RealitySceneKey.self] = newValue
        }
    }
}

fileprivate struct RealitySceneKey: EnvironmentKey {
    static nonisolated(unsafe) let defaultValue = WeakBox<RealityKit.Scene>(nil)
}
