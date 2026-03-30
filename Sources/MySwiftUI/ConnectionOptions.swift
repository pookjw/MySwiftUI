// 36EBF603347E9849184AA217ACE735DB
internal import UIKit
internal import MySwiftUICore

extension EnvironmentValues {
    @inline(always)
    var connectionOptions: UIScene.ConnectionOptions? {
        get {
            if let box = self[ConnectionOptionsKey.self] {
                return box.base
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                self[ConnectionOptionsKey.self] = WeakBox(newValue)
            } else {
                self[ConnectionOptionsKey.self] = nil
            }
        }
    }
}

fileprivate struct ConnectionOptionsKey: EnvironmentKey {
    @safe static nonisolated(unsafe) let defaultValue: WeakBox<UIScene.ConnectionOptions>? = nil
}
