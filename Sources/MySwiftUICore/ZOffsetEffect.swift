public import CoreGraphics
public import Spatial

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension View {
    @_alwaysEmitIntoClient nonisolated public func offset(z: CGFloat) -> some View {
        modifier(_ZOffsetEffect(offset: z))
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct _ZOffsetEffect {
    public var offset: CGFloat
    
    public func effectValue(size: Size3D) -> AffineTransform3D {
        var d0 = size.width
        let d1 = size.height
        let d2 = size.depth
        d0 = self.offset
        // sp
        let vector = Vector3D(x: d0, y: d1, z: d2)
        // sp + 0x20
        let translation = AffineTransform3D(translation: vector)
        return translation
    }
    
    public var animatableData: Double {
        get {
            return self.offset
        }
        set {
            self.offset = newValue
        }
    }
    
    nonisolated public init(offset: CGFloat) {
        self.offset = offset
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _ZOffsetEffect : Animatable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _ZOffsetEffect : ViewModifier {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _ZOffsetEffect : _GeometryEffect3D {}
