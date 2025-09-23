#warning("TODO")
internal import MySwiftUICore

struct MenuOrderPreferenceKey: HostPreferenceKey {
    static var defaultValue: MenuOrder {
        return .automatic
    }
}
