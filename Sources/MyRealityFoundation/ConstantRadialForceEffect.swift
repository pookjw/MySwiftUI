@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ConstantRadialForceEffect : ForceEffectProtocol, Codable {
    public init(strength: Double) {
        assertUnimplemented()
    }
    
    public func update(parameters: inout ForceEffectParameters) {
        assertUnimplemented()
    }
    
    public let strength: Float
    
    public var parameterTypes: PhysicsBodyParameterTypes {
        get {
            assertUnimplemented()
        }
    }
    
    public var forceMode: ForceMode
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
