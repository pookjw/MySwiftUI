@_spi(Internal) internal import MySwiftUICore

struct PersistentSystemOverlaysKey : HostPreferenceKey {
    static var defaultValue: PersistentSystemOverlaysKey.Overlays? {
        return nil
    }
    
    static func reduce(value: inout PersistentSystemOverlaysKey.Overlays?, nextValue: () -> PersistentSystemOverlaysKey.Overlays?) {
        assertUnimplemented()
    }
    
    static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    static var _includesRemovedValues: Bool {
        assertUnimplemented()
    }
}

extension PersistentSystemOverlaysKey {
    struct Overlays {
        var visibility: Visibility
        var isAnimated: Bool
        // TODO
    }
}
