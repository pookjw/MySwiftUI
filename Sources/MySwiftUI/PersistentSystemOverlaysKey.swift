internal import MySwiftUICore

struct PersistentSystemOverlaysKey: HostPreferenceKey {
    static var defaultValue: Never {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
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
