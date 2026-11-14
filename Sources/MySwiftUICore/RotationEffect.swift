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
        var d0 = size.width
        var d1 = size.height
        let d2 = self.angle.radians
        let d3 = self.anchor.x
        let d4 = self.anchor.y
        
        let d8 = d4
        let d9 = d3
        let d10 = d2
        let d11 = d1
        let d12 = d0
        
        d0 = d0 * d3
        d1 = d1 * d4
        
        let transform_1 = CGAffineTransform(translationX: d0, y: d1)
        let transform_2 = transform_1.rotated(by: d10)
        
        d0 = -(d12 * d9)
        d1 = -(d11 * d8)
        
        let transform_3 = transform_2.translatedBy(x: d0, y: d1)
        return ProjectionTransform(transform_3)
    }

    public typealias AnimatableData = AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>

    public var animatableData: AnimatableData {
        get {
            var d0 = self.angle.radians
            var d1 = self.anchor.x
            var d2 = self.anchor.y
            let d3: Double = 128
            d0 = d0 * d3
            d1 = d1 * d3
            d2 = d2 * d3
            
            return AnimatablePair(d0, AnimatablePair(d1, d2))
        }
        set {
            self.angle.radians = newValue.first * (1.0 / 128.0)
            self.anchor.x = newValue.second.first * (1.0 / 128.0)
            self.anchor.y = newValue.second.second * (1.0 / 128.0)
        }
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

extension _RotationEffect : GeometryEffectProvider {
    static func resolve(effect: _RotationEffect, origin: inout CGPoint, size: CGSize, layoutDirection: LayoutDirection) -> DisplayList.Effect {
        assertUnimplemented()
    }
}

extension _RotationEffect : ExtendedAnimatable {
    public mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    static func shouldFinishEarly(in context: AnimationSettlingContext<AnimatablePair<Double, AnimatablePair<CGFloat, CGFloat>>>) -> Bool {
        assertUnimplemented()
    }
}

extension _RotationEffect : ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}
