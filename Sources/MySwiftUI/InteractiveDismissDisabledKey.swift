internal import MySwiftUICore

struct InteractiveDismissDisabledKey : HostPreferenceKey {
    static var defaultValue: Bool? {
        return nil
    }
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        assertUnimplemented()
    }
}
