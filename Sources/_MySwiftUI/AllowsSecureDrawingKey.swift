internal import MySwiftUICore

struct AllowsSecureDrawingKey: HostPreferenceKey {
    static var defaultValue: Bool? {
        return nil
    }
    
    static func reduce(value: inout Bool?, nextValue: () -> Bool?) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
