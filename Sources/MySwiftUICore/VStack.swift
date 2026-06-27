public import CoreGraphics

@frozen public struct VStack<Content> : View where Content : View {
    @usableFromInline
    internal var _tree: _VariadicView.Tree<_VStackLayout, Content>
    
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(
            _VStackLayout(alignment: alignment, spacing: spacing)
        ) {
            content()
        }
    }
    
    nonisolated public static func _makeView(view: _GraphValue<VStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - x34
         inputs -> x1
         */
        // sp + 0x20
        let copy_1 = inputs
        let tree = view[{ .of(&$0._tree) }]
        
        return _VariadicView.Tree<_VStackLayout, Content>.makePlatformSubstitutableView(view: tree, inputs: copy_1)
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension VStack : Sendable {
}

extension VStack : UnaryView, PrimitiveView {}
