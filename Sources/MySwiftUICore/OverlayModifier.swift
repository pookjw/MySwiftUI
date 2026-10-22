public import CoreGraphics

extension View {
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @inlinable @_disfavoredOverload nonisolated public func overlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .center) -> some View where Overlay : View {
        return modifier(_OverlayModifier(
            overlay: overlay, alignment: alignment))
    }
    
    @inlinable nonisolated public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle {
        let style = StrokeStyle(lineWidth: width)
        let strokedRectangle = Rectangle()
            .inset(by: style.lineWidth * 0.5)
            .stroke(style: style)
            .fill(content, style: FillStyle(antialiased: true))
        return overlay(strokedRectangle)
    }
    
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @inlinable nonisolated public func overlay<V>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View {
        modifier(_OverlayModifier(overlay: content(), alignment: alignment))
    }
    
    @inlinable nonisolated public func overlay<S>(_ style: S, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View where S : ShapeStyle {
        modifier(_OverlayStyleModifier(
            style: style, ignoresSafeAreaEdges: edges))
    }
    
    @inlinable nonisolated public func overlay<S, T>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View where S : ShapeStyle, T : Shape {
        modifier(_OverlayShapeModifier(
            style: style, shape: shape, fillStyle: fillStyle))
    }
}

@frozen public struct _OverlayModifier<Overlay> : ViewModifier where Overlay : View {
    @safe public nonisolated(unsafe) var overlay: Overlay
    @safe public nonisolated(unsafe) var alignment: Alignment
    
    @inlinable public nonisolated init(overlay: Overlay, alignment: Alignment = .center) {
        self.overlay = overlay
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OverlayModifier<Overlay>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return makeSecondaryLayerView(
            secondaryLayer: modifier[{ .of(&$0.overlay)}].value,
            alignment: modifier[{ .of(&$0.alignment)}].value,
            inputs: inputs,
            body: body,
            flipOrder: false
        )
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _OverlayModifier : Sendable {
}

extension _OverlayModifier : Equatable where Overlay : Equatable {
    public static func == (a: _OverlayModifier<Overlay>, b: _OverlayModifier<Overlay>) -> Bool {
        assertUnimplemented()
    }
}

extension _OverlayModifier : MultiViewModifier, PrimitiveViewModifier {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _OverlayStyleModifier<Style> : ViewModifier where Style : ShapeStyle {
    public var style: Style
    public var ignoresSafeAreaEdges: Edge.Set
    
    @inlinable public init(style: Style, ignoresSafeAreaEdges: Edge.Set) {
        self.style = style
        self.ignoresSafeAreaEdges = ignoresSafeAreaEdges
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OverlayStyleModifier<Style>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _OverlayStyleModifier : Sendable {
}

extension _OverlayStyleModifier : MultiViewModifier, PrimitiveViewModifier {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _OverlayShapeModifier<Style, Bounds> : ViewModifier where Style : ShapeStyle, Bounds : Shape {
    public var style: Style
    public var shape: Bounds
    public var fillStyle: FillStyle
    
    @inlinable public init(style: Style, shape: Bounds, fillStyle: FillStyle) {
        self.style = style
        self.shape = shape
        self.fillStyle = fillStyle
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OverlayShapeModifier<Style, Bounds>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _OverlayShapeModifier : Sendable {
}

extension _OverlayShapeModifier : MultiViewModifier, PrimitiveViewModifier {}
