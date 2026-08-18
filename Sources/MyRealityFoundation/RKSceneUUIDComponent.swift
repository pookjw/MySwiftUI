private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKSceneUUIDComponent {
    @safe @_hasMissingDesignatedInitializers final public class Registration : @unchecked Sendable {
        private nonisolated(unsafe) let introspectionStruct: OpaquePointer
        final public let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "RASceneUUID
            let componentName = "MRASceneUUID"
            
            let result = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .initialize(
                        pointer.baseAddress.unsafelyUnwrapped,
                        Int32(MemoryLayout<__RKSceneUUIDComponent>.size),
                        nil,
                        nil
                    )
            }
            
            guard result else {
                builder.destroy()
                throw __RKSceneUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            "uuid".utf8CString.withUnsafeBufferPointer { pointer in
                unsafe builder.addMemberCStyleArrayDataTypeWithTag(
                    1,
                    pointer.baseAddress.unsafelyUnwrapped,
                    .unknown2,
                    0,
                    0x10
                )
            }
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __RKSceneUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let componentType = componentName.withCString { pointer in
                let info = unsafe CoreRE::CustomComponentTypeInfo(
                    unknown0: 1,
                    unknown1: pointer,
                    unknown2: 0,
                    unknown3: nil,
                    unknown4: nil,
                    unknown5: nil,
                    unknown6: nil,
                    unknown7: nil,
                    unknown8: 0,
                    unknown9: introspection,
                    unknown10: nil
                )
                
                return withUnsafePointer(to: info) { pointer in
                    return unsafe CoreRE::Component.ClassPtr.createCustomComponentType(
                        info: pointer
                    )
                }
            }
            
            guard let componentType else {
                builder.destroy()
                throw __RKSceneUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.componentType = unsafeBitCast(componentType, to: OpaquePointer.self)
            builder.destroy()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public fileprivate(set) nonisolated(unsafe) static var registration: __RKSceneUUIDComponent.Registration?
}

extension __RKSceneUUIDComponent.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

extension __RKSceneUUIDComponent : RegisterableComponent {
    static func register() throws {
        unsafe __RKSceneUUIDComponent.registration = try __RKSceneUUIDComponent.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}
