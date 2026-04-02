internal import MySwiftUICore

struct AllowsSecureDrawingKey : HostPreferenceKey {
    static var defaultValue: Bool? {
        return nil
    }
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        assertUnimplemented()
    }
    
    static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    static var _includesRemovedValues: Bool {
        assertUnimplemented()
    }
}
