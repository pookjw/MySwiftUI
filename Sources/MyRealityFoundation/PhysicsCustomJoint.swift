@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsCustomJoint : PhysicsJoint {
    public var pin0: GeometricPin
    
    public var pin1: GeometricPin
    
    public var checksForInternalCollisions: Bool
    
    public var isActive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public enum MotionLimit : Equatable {
        case fixed
        case unlimited
        case range(ClosedRange<Float>)
        
        public static func == (a: PhysicsCustomJoint.MotionLimit, b: PhysicsCustomJoint.MotionLimit) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var linearMotionAlongX: PhysicsCustomJoint.MotionLimit
    
    public var linearMotionAlongY: PhysicsCustomJoint.MotionLimit
    
    public var linearMotionAlongZ: PhysicsCustomJoint.MotionLimit
    
    public var angularMotionAroundX: PhysicsCustomJoint.MotionLimit
    
    public var angularMotionAroundY: PhysicsCustomJoint.MotionLimit
    
    public var angularMotionAroundZ: PhysicsCustomJoint.MotionLimit
    
    public init(pin0: GeometricPin, pin1: GeometricPin, linearMotionAlongX: PhysicsCustomJoint.MotionLimit = .fixed, linearMotionAlongY: PhysicsCustomJoint.MotionLimit = .fixed, linearMotionAlongZ: PhysicsCustomJoint.MotionLimit = .fixed, angularMotionAroundX: PhysicsCustomJoint.MotionLimit = .fixed, angularMotionAroundY: PhysicsCustomJoint.MotionLimit = .fixed, angularMotionAroundZ: PhysicsCustomJoint.MotionLimit = .fixed, checksForInternalCollisions: Bool = false) {
        assertUnimplemented()
    }
    
    public static func == (a: PhysicsCustomJoint, b: PhysicsCustomJoint) -> Bool {
        assertUnimplemented()
    }
}
