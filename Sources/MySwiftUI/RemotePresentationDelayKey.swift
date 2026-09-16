internal import MySwiftUICore

struct RemotePresentationDelayKey : HostPreferenceKey {
    static var defaultValue: Bool {
        return false
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        assertUnimplemented()
    }
}
