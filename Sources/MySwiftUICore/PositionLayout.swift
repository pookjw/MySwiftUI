public import CoreGraphics

@frozen public struct _PositionLayout {
    public var position: CGPoint

    @inlinable public init(position: CGPoint) {
        self.position = position
    }

    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

extension _PositionLayout : Animatable {}
extension _PositionLayout : ViewModifier {}
extension _PositionLayout : Sendable {}
extension _PositionLayout : BitwiseCopyable {}

extension _PositionLayout : UnaryLayout {
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    nonisolated func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        assertUnimplemented()
    }
    
    nonisolated func layoutPriority(child: LayoutProxy) -> Double {
        return 0
    }
    
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        return false
    }
}

extension View {
    @inlinable nonisolated public func position(_ position: CGPoint) -> some View {
        return modifier(_PositionLayout(position: position))
    }

    @inlinable nonisolated public func position(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        return position(CGPoint(x: x, y: y))
    }
}
