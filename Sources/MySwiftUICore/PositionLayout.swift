public import CoreGraphics

@frozen public struct _PositionLayout : ViewModifier, Animatable, Sendable {
    public var position: CGPoint

    @inlinable public init(position: CGPoint) {
        self.position = position
    }

    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

extension View {
    @inlinable nonisolated public func position(_ position: CGPoint) -> some View {
        return modifier(_PositionLayout(position: position))
    }

    @inlinable nonisolated public func position(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        return position(CGPoint(x: x, y: y))
    }
}
