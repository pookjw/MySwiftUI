internal import MySwiftUICore

extension EnvironmentValues {
    var isAnimatingSceneResize: Bool {
        get {
            return self[IsAnimatingSceneResize.self]
        }
        set {
            self[IsAnimatingSceneResize.self] = newValue
        }
    }
    
    fileprivate struct IsAnimatingSceneResize: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
