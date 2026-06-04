@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
public struct PixelCastHit : Equatable, Sendable {
    public var entity: Entity {
        get {
            assertUnimplemented()
        }
    }
    
    public var normal: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var position: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var meshPart: UInt64 {
        get {
            assertUnimplemented()
        }
    }
    
    public var instance: UInt32 {
        get {
            assertUnimplemented()
        }
    }
    
    public var primitive: UInt32 {
        get {
            assertUnimplemented()
        }
    }
    
    public var barycentric: SIMD3<Float>? {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: PixelCastHit, b: PixelCastHit) -> Bool {
        assertUnimplemented()
    }
}
