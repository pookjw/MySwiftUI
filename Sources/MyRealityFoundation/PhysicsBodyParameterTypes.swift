@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsBodyParameterTypes : Codable, OptionSet {
    @safe public static let position: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let orientation: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let velocity: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let angularVelocity: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let distance: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let mass: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    @safe public static let inertiaTensor: PhysicsBodyParameterTypes = {
        assertUnimplemented()
    }()
    
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ArrayLiteralElement = PhysicsBodyParameterTypes
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Element = PhysicsBodyParameterTypes
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias RawValue = UInt32
}
