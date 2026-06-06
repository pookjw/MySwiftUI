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
        assertUnimplemented()
    }
    
    public var animatableData: Double {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    nonisolated public init(offset: CGFloat) {
        assertUnimplemented()
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
extension _ZOffsetEffect : GeometryEffect3D {}
