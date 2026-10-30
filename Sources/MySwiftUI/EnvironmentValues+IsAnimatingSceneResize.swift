// 8AAAA4D63B50F40D5CB8153199822A94
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
    
    fileprivate struct IsAnimatingSceneResize : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
