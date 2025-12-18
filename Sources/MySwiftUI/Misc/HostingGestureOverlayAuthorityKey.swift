internal import MySwiftUICore

struct HostingGestureOverlayAuthorityKey: HostPreferenceKey {
    typealias Value = Bool?
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        fatalError("TODO")
    }
}
