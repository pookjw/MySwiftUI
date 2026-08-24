private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKScenePhysics {
    public var gravity: SIMD3<Float>
    
    public var adaptiveTimeStep: Bool
    
    @safe @_hasMissingDesignatedInitializers public class Registration {
        private let introspectionStruct: OpaquePointer
        final public let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "REScenePhysics"
            let componentName = "MREScenePhysics"
            
            let result = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .initialize(
                        pointer.baseAddress.unsafelyUnwrapped,
                        Int32(MemoryLayout<__RKScenePhysics>.size),
                        nil,
                        nil
                    )
            }
            
            guard result else {
                builder.destroy()
                throw __RKScenePhysics.Registration.RegistrationError.builderFailed
            }
            
            "gravity".withCString { pointer in
                unsafe builder
                    .addMemberDataTypeWithTag(
                        1,
                        pointer,
                        .unknown12,
                        0
                    )
            }
            
            "adaptiveTimeStep".utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .addMemberDataTypeWithTag(
                        2,
                        pointer.baseAddress.unsafelyUnwrapped,
                        .unknown0,
                        0x10
                    )
            }
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __RKScenePhysics.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let componentType = componentName.withCString { pointer in
                let info = unsafe CoreRE::CustomComponentTypeInfo(
                    unknown0: 1,
                    unknown1: pointer,
                    unknown2: nil,
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
                    return unsafe CoreRE::Component.ClassPtr.createCustomComponentType(pointer)
                }
            }
            
            guard let componentType else {
                builder.destroy()
                throw __RKScenePhysics.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.componentType = unsafeBitCast(componentType, to: OpaquePointer.self)
            builder.destroy()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public static nonisolated(unsafe) var registration: __RKScenePhysics.Registration?
}

extension __RKScenePhysics.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

extension __RKScenePhysics : RegisterableComponent {
    static func register() throws {
        unsafe __RKScenePhysics.registration = try __RKScenePhysics.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}
