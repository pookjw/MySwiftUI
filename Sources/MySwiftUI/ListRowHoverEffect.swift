@_spi(Internal) internal import MySwiftUICore

struct ListRowHoverEffectPreferenceKey : HostPreferenceKey {
    static var defaultValue: HoverEffect? {
        assertUnimplemented()
    }
    
    static func reduce(value: inout HoverEffect?, nextValue: () -> HoverEffect?) {
        assertUnimplemented()
    }
}

struct DefaultListRowHoverEffectPreferenceKey : HostPreferenceKey {
    static var defaultValue: HoverEffect? {
        assertUnimplemented()
    }
    
    static func reduce(value: inout HoverEffect?, nextValue: () -> HoverEffect?) {
        assertUnimplemented()
    }
}

struct ListRowHoverEffectDisabledPreferenceKey : HostPreferenceKey {
    static var defaultValue: Bool {
        assertUnimplemented()
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        assertUnimplemented()
    }
}

struct UsesPreferenceBasedListRowHoverEffectsKey : HostPreferenceKey {
    static var defaultValue: Bool {
        assertUnimplemented()
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        assertUnimplemented()
    }
}
