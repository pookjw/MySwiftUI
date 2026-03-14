internal import MySwiftUICore

struct HasContextMenuKey: HostPreferenceKey {
    static var defaultValue: Bool {
        return false
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        fatalError("TODO")
    }
}
