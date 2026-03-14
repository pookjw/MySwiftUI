internal import MySwiftUICore

struct HostingGestureOverlayAuthorityKey: HostPreferenceKey {
    static var defaultValue: Bool {
        return false
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        fatalError("TODO")
    }
}
