@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsFixedJoint : PhysicsJoint {
    public var pin0: GeometricPin
    
    public var pin1: GeometricPin
    
    public let checksForInternalCollisions: Bool
    
    public var isActive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public init(pin0: GeometricPin, pin1: GeometricPin) {
        assertUnimplemented()
    }
    
    public static func == (a: PhysicsFixedJoint, b: PhysicsFixedJoint) -> Bool {
        assertUnimplemented()
    }
}
