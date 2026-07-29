package import MySwiftUICore
package import UIKit
private import os.log

extension EnvironmentValues {
    var windowScene: UIWindowScene? {
        get {
            return self[WindowSceneKey.self].base
        }
        set {
            self[WindowSceneKey.self] = WeakBox(newValue)
        }
    }
    
    package var sceneSession : UISceneSession? {
        get {
            guard let windowScene else {
                return nil
            }
            
            return windowScene.session
        }
        set {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Setting the scene session is not supported.")
        }
    }
}

fileprivate struct WindowSceneKey : EnvironmentKey {
    static var defaultValue: WeakBox<UIWindowScene> {
        return WeakBox(nil)
    }
}
