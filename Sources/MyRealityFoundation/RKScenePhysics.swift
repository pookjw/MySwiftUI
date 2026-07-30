@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKScenePhysics {
    public var gravity: SIMD3<Float>
    
    public var adaptiveTimeStep: Bool
    
    @_hasMissingDesignatedInitializers public class Registration {
        final public nonisolated(unsafe) let componentType: OpaquePointer = {
            assertUnimplemented()
        }()
        }
    
    public static var registration: __RKScenePhysics.Registration? {
        assertUnimplemented()
    }
}

extension __RKScenePhysics : RegisterableComponent {
    static func register() throws {
        assertUnimplemented()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}
