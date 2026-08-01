// 10350759597CCAC313BDAB4A8E209EAC
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityTagsComponent {
    public var tags: [String] {
        mutating get {
            assertUnimplemented()
        }
        set(newTags) {
            assertUnimplemented()
        }
    }
    
    
    @safe @_hasMissingDesignatedInitializers public class Registration {
        private let introspectionStruct: OpaquePointer
        private let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "RETags"
            let componentName = "MRETags"
            
            let result = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .initialize(
                        pointer.baseAddress.unsafelyUnwrapped,
                        Int32(MemoryLayout<__RKEntityTagsComponent>.size),
                        nil,
                        nil
                    )
            }
            
            guard result else {
                builder.destroy()
                throw __RKEntityTagsComponent.Registration.RegistrationError.builderFailed
            }
            
            "tags".utf8CString.withUnsafeBufferPointer { pointer in
                unsafe builder
                    .addMemberArrayWithCountDataTypeWithTag(
                        1,
                        pointer.baseAddress.unsafelyUnwrapped,
                        0x11,
                        0,
                        .unknown5,
                        8
                    )
            }
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __RKEntityTagsComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let componentType = componentName.withCString { pointer in
                let info = unsafe CoreRE::CustomComponentTypeInfo(
                    unknown0: 1,
                    unknown1: pointer,
                    unknown2: 0,
                    unknown3: { p1 in
                        return unsafe createTagsComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown4: { p1, p2 in
                        unsafe destroyTagsComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self),
                            rawComponentPointer: p2
                        )
                    },
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
            
            self.componentType = unsafe unsafeBitCast(componentType, to: OpaquePointer.self)
            builder.destroy()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public fileprivate(set) static nonisolated(unsafe) var registration: __RKEntityTagsComponent.Registration?
}

extension __RKEntityTagsComponent.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

extension __RKEntityTagsComponent : RegisterableComponent {
    static func register() throws {
        unsafe __RKEntityTagsComponent.registration = try __RKEntityTagsComponent.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}

fileprivate nonisolated func createTagsComponentObject(componentType: OpaquePointer) -> UnsafeMutableRawPointer {
    assertUnimplemented()
}

fileprivate nonisolated func destroyTagsComponentObject(componentType: OpaquePointer, rawComponentPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}
