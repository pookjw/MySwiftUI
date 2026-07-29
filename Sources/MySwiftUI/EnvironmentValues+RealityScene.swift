internal import MySwiftUICore
package import RealityKit

extension EnvironmentValues {
    package var realityScene: RealityKit::Scene? {
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
    static let defaultValue: WeakBox<RealityKit::Scene>? = nil
}
