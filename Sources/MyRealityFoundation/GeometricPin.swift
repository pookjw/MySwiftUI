public import simd

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct GeometricPin : Hashable {
    public init(named name: String, offsetPosition: SIMD3<Float> = SIMD3<Float>(0, 0, 0), offsetOrientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)) {
        assertUnimplemented()
    }
    
    public init(named name: String, skeletalJointName: String, offsetPosition: SIMD3<Float> = SIMD3<Float>(0, 0, 0), offsetOrientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)) {
        assertUnimplemented()
    }
    
    @MainActor public var position: SIMD3<Float>? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var orientation: simd_quatf? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public func position(relativeTo referenceEntity: Entity?) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @MainActor public func orientation(relativeTo referenceEntity: Entity?) -> simd_quatf? {
        assertUnimplemented()
    }
    weak public var entity: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    public var name: String
    
    public var offsetPosition: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var offsetOrientation: simd_quatf {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public static func == (lhs: GeometricPin, rhs: GeometricPin) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
