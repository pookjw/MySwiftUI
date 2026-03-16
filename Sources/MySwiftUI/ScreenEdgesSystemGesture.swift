internal import MySwiftUICore

struct ScreenEdgesSystemGestureKey: HostPreferenceKey {
    static var defaultValue: Edge.Set? {
        return nil
    }
    
    static func reduce(value: inout Edge.Set?, nextValue: () -> Edge.Set?) {
        assertUnimplemented()
    }
    
    static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    static var _includesRemovedValues: Bool {
        assertUnimplemented()
    }
}
