@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsDistanceJoint : PhysicsJoint {
    public var pin0: GeometricPin
    
    public var pin1: GeometricPin
    
    public var checksForInternalCollisions: Bool
    
    public var isActive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var distanceLimit: ClosedRange<Float>
    
    public var tolerance: Float
    
    public init(pin0: GeometricPin, pin1: GeometricPin, distanceLimit: ClosedRange<Float>, checksForInternalCollisions: Bool = false) {
        assertUnimplemented()
    }
    
    public static func == (a: PhysicsDistanceJoint, b: PhysicsDistanceJoint) -> Bool {
        assertUnimplemented()
    }
}
