@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionCastHit : Equatable {
    public var entity: Entity {
        get {
            assertUnimplemented()
        }
    }
    
    public var position: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var normal: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var distance: Float {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: CollisionCastHit, b: CollisionCastHit) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionCastHit {
    public struct TriangleHit : Equatable {
        public var faceIndex: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var uv: SIMD2<Float> {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: CollisionCastHit.TriangleHit, b: CollisionCastHit.TriangleHit) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var triangleHit: CollisionCastHit.TriangleHit? {
        get {
            assertUnimplemented()
        }
    }
    
    public var shapeIndex: Int {
        get {
            assertUnimplemented()
        }
    }
}
