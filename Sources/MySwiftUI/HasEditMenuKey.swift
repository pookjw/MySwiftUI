@_spi(Internal) internal import MySwiftUICore

struct HasEditMenuKey : HostPreferenceKey {
    static var defaultValue: Bool {
        return false
    }

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = value || nextValue()
    }
}
