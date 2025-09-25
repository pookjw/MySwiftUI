internal import MySwiftUICore

extension EnvironmentValues {
    var activeContextMenu: ActiveContextMenu {
        get {
            return self[ActiveContextMenuKey.self]
        }
        set {
            self[ActiveContextMenuKey.self] = newValue
        }
    }
}

fileprivate struct ActiveContextMenuKey: EnvironmentKey {
    static let defaultValue = ActiveContextMenu()
}
