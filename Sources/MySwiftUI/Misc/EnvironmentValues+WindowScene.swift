internal import MySwiftUICore
internal import UIKit

extension EnvironmentValues {
    var windowScene: UIWindowScene? {
        get {
            return self[WindowSceneKey.self].base
        }
        set {
            self[WindowSceneKey.self] = WeakBox(newValue)
        }
    }
}

fileprivate struct WindowSceneKey: EnvironmentKey {
    static var defaultValue: WeakBox<UIWindowScene> {
        return WeakBox(nil)
    }
}
