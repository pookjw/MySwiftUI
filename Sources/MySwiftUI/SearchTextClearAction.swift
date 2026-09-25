// 9531581B04EE0424C8EAE287594C1B2C
internal import MySwiftUICore

struct SearchTextClearAction {
    private var action: () -> Void
}

extension EnvironmentValues {
    var searchTextClearAction: SearchTextClearAction? {
        get {
            return self[EnvironmentValues.__Key_searchTextClearAction.self]
        }
        set {
            self[EnvironmentValues.__Key_searchTextClearAction.self] = newValue
        }
    }
    
    fileprivate struct __Key_searchTextClearAction : EnvironmentKey {
        static var defaultValue: SearchTextClearAction? {
            return nil
        }
    }
}
