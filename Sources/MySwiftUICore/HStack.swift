public import CoreGraphics

@frozen public struct HStack<Content> : View where Content : View {
    @usableFromInline
    internal var _tree: _VariadicView.Tree<_HStackLayout, Content>
    
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(
            _HStackLayout(alignment: alignment, spacing: spacing)
        ) {
            content()
        }
    }
    
    nonisolated public static func _makeView(view: _GraphValue<HStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        let value = view[{ .of(&$0._tree) }]
        return _VariadicView.Tree<_HStackLayout, Content>.makePlatformSubstitutableView(view: value, inputs: inputs)
    }
    
    public typealias Body = Swift.Never
}

@available(*, unavailable)
extension HStack : Sendable {
}

extension HStack : UnaryView, PrimitiveView {}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct HStackLayout : Layout {
    public var alignment: VerticalAlignment
    public var spacing: CGFloat?
    
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Cache = _HStackLayout.Cache
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension HStackLayout : BitwiseCopyable {}

extension HStackLayout : DerivedLayout {
    var base: _HStackLayout {
        return _HStackLayout(alignment: self.alignment, spacing: self.spacing)
    }
}
