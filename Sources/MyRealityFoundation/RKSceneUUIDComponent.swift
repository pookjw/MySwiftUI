@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKSceneUUIDComponent {
    @safe @_hasMissingDesignatedInitializers final public class Registration : Sendable {
        private nonisolated(unsafe) let introspectionStruct: OpaquePointer
        final public nonisolated(unsafe) let componentType: OpaquePointer
        
        init() throws {
            assertUnimplemented()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public fileprivate(set) nonisolated(unsafe) static var registration: __RKSceneUUIDComponent.Registration?
}

extension __RKSceneUUIDComponent : RegisterableComponent {
    static func register() throws {
        unsafe __RKSceneUUIDComponent.registration = try __RKSceneUUIDComponent.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}
