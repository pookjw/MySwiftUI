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
    struct Overlays : Equatable {
        var visibility: Visibility
        var isAnimated: Bool
        // TODO
    }
}

extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func persistentSystemOverlays(_ visibility: Visibility) -> some View {
        assertUnimplemented()
    }
}
