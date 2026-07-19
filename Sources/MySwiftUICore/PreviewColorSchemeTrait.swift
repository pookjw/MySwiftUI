@available(iOS 14.5, macOS 11.3, tvOS 14.5, watchOS 7.4, *)
package struct PreviewColorSchemeTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: ColorScheme? {
        get { nil }
    }
    @available(iOS 14.5, tvOS 14.5, watchOS 7.4, macOS 11.3, *)
    @usableFromInline
    package typealias Value = ColorScheme?
}

@available(*, unavailable)
extension PreviewColorSchemeTraitKey : Sendable {
}
