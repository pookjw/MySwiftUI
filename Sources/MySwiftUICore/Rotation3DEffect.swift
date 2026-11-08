public import CoreGraphics

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct _Rotation3DEffect : GeometryEffect, Equatable {
    public var angle: Angle
    public var axis: (x: CGFloat, y: CGFloat, z: CGFloat)
    public var anchor: UnitPoint
    public var anchorZ: CGFloat
    public var perspective: CGFloat

    @_alwaysEmitIntoClient nonisolated public init(
        angle: Angle,
        axis: (x: CGFloat, y: CGFloat, z: CGFloat),
        anchor: UnitPoint = .center,
        anchorZ: CGFloat = 0,
        perspective: CGFloat = 1
    ) {
        self.angle = angle
        self.axis = axis
        self.anchor = anchor
        self.anchorZ = anchorZ
        self.perspective = perspective
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        assertUnimplemented()
    }

    public typealias AnimatableData = AnimatablePair<Angle.AnimatableData, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<UnitPoint.AnimatableData, AnimatablePair<CGFloat, CGFloat>>>>>>

    public var animatableData: AnimatableData {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }

    public static func == (lhs: _Rotation3DEffect, rhs: _Rotation3DEffect) -> Bool {
        assertUnimplemented()
    }

    public typealias Body = Never
}

extension _Rotation3DEffect : Sendable {}
extension _Rotation3DEffect : BitwiseCopyable {}

extension _Rotation3DEffect {
    package struct Data {
        private(set) var angle: Angle
        private(set) var axis: (x: CGFloat, y: CGFloat, z: CGFloat)
        private(set) var anchor: (x: CGFloat, y: CGFloat, z: CGFloat)
        private(set) var perspective: CGFloat
        private(set) var flipWidth: CGFloat
    }
}
