extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @inlinable nonisolated public func backgroundStyle<S>(_ style: S) -> some View where S : ShapeStyle {
        return modifier(_EnvironmentBackgroundStyleModifier(style: style))
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension EnvironmentValues {
    public var backgroundStyle: AnyShapeStyle? {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _EnvironmentBackgroundStyleModifier<S> where S : ShapeStyle {
    @usableFromInline
    internal var style: S

    @inlinable internal init(style: S) { self.style = style }

    nonisolated public static func _makeViewInputs(modifier: _GraphValue<_EnvironmentBackgroundStyleModifier<S>>, inputs: inout _ViewInputs) {
        assertUnimplemented()
    }

    nonisolated public static func _makeViewList(modifier: _GraphValue<_EnvironmentBackgroundStyleModifier<S>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }

    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, macOS 13.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _EnvironmentBackgroundStyleModifier : Sendable {
}

extension _EnvironmentBackgroundStyleModifier : ViewModifier {}
