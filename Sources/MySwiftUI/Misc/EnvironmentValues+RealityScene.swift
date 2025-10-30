internal import MySwiftUICore
internal import RealityKit

extension EnvironmentValues {
    var realityScene: WeakBox<RealityKit.Scene> {
        get {
            return unsafe self[RealitySceneKey.self]
        }
        set {
            unsafe self[RealitySceneKey.self] = newValue
        }
    }
}

fileprivate struct RealitySceneKey: @unsafe EnvironmentKey {
    static nonisolated(unsafe) let defaultValue = WeakBox<RealityKit.Scene>(nil)
}
