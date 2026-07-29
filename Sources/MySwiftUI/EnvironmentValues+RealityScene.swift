internal import MySwiftUICore
internal import RealityKit

extension EnvironmentValues {
    package var realityScene: RE_Scene? {
        get {
            return self[RealitySceneKey.self]?.base
        }
        set {
            if let newValue {
                self[RealitySceneKey.self] = WeakBox(newValue)
            } else {
                self[RealitySceneKey.self] = nil
            }
        }
    }
}

fileprivate struct RealitySceneKey : EnvironmentKey {
    static let defaultValue: WeakBox<RE_Scene>? = nil
}
