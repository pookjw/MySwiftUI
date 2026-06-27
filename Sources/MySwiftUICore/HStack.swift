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
        assertUnimplemented()
    }
    
    public typealias Body = Swift.Never
}

@available(*, unavailable)
extension HStack : Sendable {
}

extension HStack : UnaryView, PrimitiveView {}
