public struct PreferredColorSchemeKey : PreferenceKey {
    public typealias Value = ColorScheme?

    public static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    public static func reduce(value: inout PreferredColorSchemeKey.Value, nextValue: () -> PreferredColorSchemeKey.Value) {
        guard value == nil else {
            return
        }
        value = nextValue()
    }
}

@_spi(Internal) extension PreferredColorSchemeKey : HostPreferenceKey {}

@available(*, unavailable)
extension PreferredColorSchemeKey : Sendable {}
