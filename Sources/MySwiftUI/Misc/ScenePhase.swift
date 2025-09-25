public import MySwiftUICore

public enum ScenePhase: Comparable {
    case background
    case inactive
    case active
}

extension ScenePhase: Sendable {}
extension ScenePhase: Hashable {}

extension EnvironmentValues {
    public var scenePhase: ScenePhase {
        get {
            return self[ScenePhaseKey.self]
        }
        set {
            self[ScenePhaseKey.self] = newValue
        }
    }
}

struct ScenePhaseKey: EnvironmentKey {
    static var defaultValue: ScenePhase {
        return .background
    }
}
