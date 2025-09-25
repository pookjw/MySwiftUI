internal import MySwiftUICore

extension EnvironmentValues {
    var activeEditMenu: ActiveEditMenu? {
        get {
            return self[__Key_activeEditMenu.self]
        }
        set {
            self[__Key_activeEditMenu.self] = newValue
        }
    }
    
    #warning("TODO: Entry Macro")
    fileprivate struct __Key_activeEditMenu: EnvironmentKey {
        static var defaultValue: ActiveEditMenu? {
            return nil
        }
    }
}
