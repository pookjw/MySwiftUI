internal import MySwiftUICore

struct ScreenEdgesSystemGestureKey: HostPreferenceKey {
    static var defaultValue: Edge.Set? {
        return nil
    }
    
    static func reduce(value: inout Edge.Set?, nextValue: () -> Edge.Set?) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
