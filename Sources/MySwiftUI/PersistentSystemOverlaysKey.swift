internal import MySwiftUICore

struct PersistentSystemOverlaysKey: HostPreferenceKey {
    static var defaultValue: (preferences: PersistentSystemOverlaysKey.Overlays?, environment: Visibility?) {
        return (nil, nil)
    }
    
    static func reduce(value: inout (preferences: PersistentSystemOverlaysKey.Overlays?, environment: Visibility?), nextValue: () -> (preferences: PersistentSystemOverlaysKey.Overlays?, environment: Visibility?)) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

extension PersistentSystemOverlaysKey {
    struct Overlays {
        var visibility: Visibility
        var isAnimated: Bool
        // TODO
    }
}
