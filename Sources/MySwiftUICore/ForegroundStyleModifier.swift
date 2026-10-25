// BEFE9363F68E039B4AB6422B8AA4535A
private import AttributeGraph

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @inlinable nonisolated public func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle {
        modifier(_ForegroundStyleModifier(style: style))
    }

    @inlinable nonisolated public func foregroundStyle<S1, S2>(_ primary: S1, _ secondary: S2) -> some View where S1 : ShapeStyle, S2 : ShapeStyle {
        modifier(_ForegroundStyleModifier2(
            primary: primary, secondary: secondary))
    }

    @inlinable nonisolated public func foregroundStyle<S1, S2, S3>(_ primary: S1, _ secondary: S2, _ tertiary: S3) -> some View where S1 : ShapeStyle, S2 : ShapeStyle, S3 : ShapeStyle {
        modifier(_ForegroundStyleModifier3(
            primary: primary, secondary: secondary, tertiary: tertiary))
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _ForegroundStyleModifier<Style> where Style : ShapeStyle {
    public var style: Style

    @inlinable public init(style: Style) {
        self.style = style
    }

    nonisolated public static func _makeViewInputs(modifier: _GraphValue<_ForegroundStyleModifier<Style>>, inputs: inout _ViewInputs) {
        inputs.environment = Attribute(
            _ForegroundStyleModifier.ForegroundStyleEnvironment(
                modifier: modifier.value,
                environment: inputs.environment
            )
        )
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _ForegroundStyleModifier : Sendable {
}

extension _ForegroundStyleModifier : ViewModifier {}
extension _ForegroundStyleModifier : PrimitiveViewModifier {}

extension _ForegroundStyleModifier : ViewInputsModifier {
    package static var graphInputsSemantics: Semantics? {
        return .v4
    }
}

extension _ForegroundStyleModifier {
    fileprivate struct ForegroundStyleEnvironment : AsyncAttribute, Rule {
        @Attribute var modifier: _ForegroundStyleModifier<Style>
        @Attribute var environment: EnvironmentValues
        
        var value: EnvironmentValues {
            assertUnimplemented()
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _ForegroundStyleModifier2<S1, S2> where S1 : ShapeStyle, S2 : ShapeStyle {
    public var primary: S1

    public var secondary: S2

    @inlinable public init(primary: S1, secondary: S2) {
        self.primary = primary
        self.secondary = secondary
    }

    nonisolated public static func _makeViewInputs(modifier: _GraphValue<_ForegroundStyleModifier2<S1, S2>>, inputs: inout _ViewInputs) {
        assertUnimplemented()
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _ForegroundStyleModifier2 : Sendable {
}

extension _ForegroundStyleModifier2 : ViewModifier {}

extension _ForegroundStyleModifier2 : PrimitiveViewModifier {}

extension _ForegroundStyleModifier2 : ViewInputsModifier {
    package static var graphInputsSemantics: Semantics? {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _ForegroundStyleModifier3<S1, S2, S3> where S1 : ShapeStyle, S2 : ShapeStyle, S3 : ShapeStyle {
    public var primary: S1

    public var secondary: S2

    public var tertiary: S3

    @inlinable public init(primary: S1, secondary: S2, tertiary: S3) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
    }

    nonisolated public static func _makeViewInputs(modifier: _GraphValue<_ForegroundStyleModifier3<S1, S2, S3>>, inputs: inout _ViewInputs) {
        assertUnimplemented()
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _ForegroundStyleModifier3 : Sendable {
}

extension _ForegroundStyleModifier3 : ViewModifier {}

extension _ForegroundStyleModifier3 : PrimitiveViewModifier {}

extension _ForegroundStyleModifier3 : ViewInputsModifier {
    package static var graphInputsSemantics: Semantics? {
        assertUnimplemented()
    }
}
