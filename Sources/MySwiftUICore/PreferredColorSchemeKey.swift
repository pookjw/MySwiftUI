public struct PreferredColorSchemeKey: HostPreferenceKey {
    public typealias Value = ColorScheme?
    
    public static func reduce(value: inout PreferredColorSchemeKey.Value, nextValue: () -> PreferredColorSchemeKey.Value) {
        guard value == nil else {
            return
        }
        value = nextValue()
    }
}

@available(*, unavailable)
extension PreferredColorSchemeKey: Sendable {}
