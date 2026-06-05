internal import MySwiftUICore
#if UseMyRealityKit
internal import MyRealityKit
#else
internal import RealityKit
#endif

extension EnvironmentValues {
    var realityScene: WeakBox<RealityKit::Scene> {
        get {
            return self[RealitySceneKey.self]
        }
        set {
            self[RealitySceneKey.self] = newValue
        }
    }
}

fileprivate struct RealitySceneKey : EnvironmentKey {
    static let defaultValue = WeakBox<RealityKit::Scene>(nil)
}
