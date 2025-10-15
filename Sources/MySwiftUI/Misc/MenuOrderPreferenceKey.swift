#warning("TODO")
internal import MySwiftUICore

struct MenuOrderPreferenceKey: HostPreferenceKey {
    static var defaultValue: MenuOrder {
        return .automatic
    }
    
    static func reduce(value: inout MenuOrder, nextValue: () -> MenuOrder) {
        fatalError("TODO")
    }
}
