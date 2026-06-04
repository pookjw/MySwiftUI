@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsSphericalJoint : PhysicsJoint {
    public var pin0: GeometricPin
    
    public var pin1: GeometricPin
    
    public var checksForInternalCollisions: Bool
    
    public var isActive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var angularLimitInYZ: (Float, Float)?
    
    public init(pin0: GeometricPin, pin1: GeometricPin, angularLimitInYZ: (Float, Float)? = nil, checksForInternalCollisions: Bool = false) {
        assertUnimplemented()
    }
    
    public static func == (lhs: PhysicsSphericalJoint, rhs: PhysicsSphericalJoint) -> Bool {
        assertUnimplemented()
    }
}
