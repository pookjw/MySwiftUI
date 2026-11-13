public import CoreGraphics

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct _RotationEffect : GeometryEffect, Equatable {
    public var angle: Angle
    public var anchor: UnitPoint

    @inlinable nonisolated public init(angle: Angle, anchor: UnitPoint = .center) {
        self.angle = angle
        self.anchor = anchor
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        assertUnimplemented()
    }

    public typealias AnimatableData = AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>

    public var animatableData: AnimatableData {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }

    public static func == (a: _RotationEffect, b: _RotationEffect) -> Bool {
        assertUnimplemented()
    }

    public typealias Body = Never
}

extension _RotationEffect : Sendable {}
extension _RotationEffect : BitwiseCopyable {}

extension View {
    @inlinable nonisolated public func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View {
        return modifier(_RotationEffect(angle: angle, anchor: anchor))
    }
}

extension _RotationEffect {
    package struct Data {
        private(set) var angle: Angle
        private(set) var anchor: CGPoint
    }
}
