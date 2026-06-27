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

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct VStackLayout : Layout {
    public var alignment: HorizontalAlignment
    public var spacing: CGFloat?
    
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Cache = _VStackLayout.Cache
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension VStackLayout : BitwiseCopyable {}

extension VStackLayout : DerivedLayout {
    var base: _VStackLayout {
        return _VStackLayout(alignment: self.alignment, spacing: self.spacing)
    }
}
