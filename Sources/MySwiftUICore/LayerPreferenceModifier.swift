@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension View {
    @inlinable nonisolated public func overlayPreferenceValue<K, V>(_ key: K.Type, alignment: Alignment = .center, @ViewBuilder _ transform: @escaping (K.Value) -> V) -> some View where K : PreferenceKey, V : View {
        return modifier(_OverlayPreferenceModifier<K, V>(
            alignment: alignment, transform: transform))
    }
    
    @inlinable nonisolated public func backgroundPreferenceValue<K, V>(_ key: K.Type, alignment: Alignment = .center, @ViewBuilder _ transform: @escaping (K.Value) -> V) -> some View where K : PreferenceKey, V : View {
        return modifier(_BackgroundPreferenceModifier<K, V>(
            alignment: alignment, transform: transform))
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _OverlayPreferenceModifier<Key, Overlay> where Key : PreferenceKey, Overlay : View {
    public var transform: (Key.Value) -> Overlay
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment, @ViewBuilder transform: @escaping (Key.Value) -> Overlay) {
        self.transform = transform
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OverlayPreferenceModifier<Key, Overlay>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, macOS 13.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _OverlayPreferenceModifier : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _OverlayPreferenceModifier : ViewModifier {}
extension _OverlayPreferenceModifier : MultiViewModifier {}
extension _OverlayPreferenceModifier : PrimitiveViewModifier {}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _BackgroundPreferenceModifier<Key, Overlay> where Key : PreferenceKey, Overlay : View {
    public var transform: (Key.Value) -> Overlay
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment, @ViewBuilder transform: @escaping (Key.Value) -> Overlay) {
        self.transform = transform
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_BackgroundPreferenceModifier<Key, Overlay>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, macOS 13.0, *)
    public typealias Body = Never
}
@available(*, unavailable)
extension _BackgroundPreferenceModifier : Sendable {
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _BackgroundPreferenceModifier : ViewModifier {}
extension _BackgroundPreferenceModifier : MultiViewModifier {}
extension _BackgroundPreferenceModifier : PrimitiveViewModifier {}
