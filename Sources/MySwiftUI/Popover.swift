// 71331E1C6C76BEBE543E8AAF4D013EB6
internal import MySwiftUICore

extension EnvironmentValues {
    var popoverAutomaticallyDismissesWhenScrolledOutOfView: Bool? {
        get {
            return self[EnvironmentValues.__Key_popoverAutomaticallyDismissesWhenScrolledOutOfView.self]
        }
        set {
            self[EnvironmentValues.__Key_popoverAutomaticallyDismissesWhenScrolledOutOfView.self] = newValue
        }
    }
    
    // TODO: Entry macro
    fileprivate struct __Key_popoverAutomaticallyDismissesWhenScrolledOutOfView : EnvironmentKey {
        static var defaultValue: Bool? {
            return nil
        }
    }
}
