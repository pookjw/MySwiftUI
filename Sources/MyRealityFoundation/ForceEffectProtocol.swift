@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol ForceEffectProtocol {
    var parameterTypes: PhysicsBodyParameterTypes { get }
    var forceMode: ForceMode { get }
    func update(parameters: inout ForceEffectParameters)
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectProtocol {
    public var parameterTypes: PhysicsBodyParameterTypes {
        get {
            assertUnimplemented()
        }
    }
    
    public func update(parameters: inout ForceEffectParameters) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func register(_ updateHandler: (@MainActor (inout ForceEffectEvent<Self>) -> Void)? = nil) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectProtocol where Self : Decodable, Self : Encodable {
    @preconcurrency @MainActor public static func register(_ updateHandler: (@MainActor (inout ForceEffectEvent<Self>) -> Void)? = nil) {
        assertUnimplemented()
    }
}
