internal import MySwiftUICore

struct InteractiveDismissDisabledKey: HostPreferenceKey {
    // TODO
    typealias Value = Never?
    
    static func reduce(value: inout Never?, nextValue: () -> Never?) {
        assertUnimplemented()
    }
}
