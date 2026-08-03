private import CoreRE

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
    
    static func __register(engine: __Engine?, _: ((inout ForceEffectEvent<Self>) -> Void)?) {
        assertUnimplemented()
    }
    
    static func create(_: Int, _: OpaquePointer) throws -> any ForceEffectBase {
        assertUnimplemented()
    }
    
    static func createFromCoreAndUserForceEffect<T : ForceEffectProtocol>(_: Int, _: OpaquePointer, _: T) -> any ForceEffectBase {
        assertUnimplemented()
    }
    
    static func eventBus(_ engine: __Engine?) -> OpaquePointer {
        if let engine {
            let coreEngine = unsafe unsafeBitCast(engine.coreEngine, to: CoreRE::Engine.self)
            let eventBus = coreEngine.eventBus
            return unsafe unsafeBitCast(eventBus, to: OpaquePointer.self)
        } else {
            let coreServiceLocator = unsafe unsafeBitCast(
                __ServiceLocator.shared.coreServiceLocator,
                to: CoreRE::ServiceLocator.self
            )
            let eventBus = coreServiceLocator.eventBus
            return unsafe unsafeBitCast(eventBus, to: OpaquePointer.self)
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectProtocol where Self : Decodable, Self : Encodable {
    @preconcurrency @MainActor public static func register(_ updateHandler: (@MainActor (inout ForceEffectEvent<Self>) -> Void)? = nil) {
        assertUnimplemented()
    }
    
    static func __register(engine: __Engine?, _: ((inout ForceEffectEvent<Self>) -> Void)?) {
        assertUnimplemented()
    }
    
    static func create(_: Int, _: OpaquePointer) throws -> any ForceEffectBase {
        assertUnimplemented()
    }
}
