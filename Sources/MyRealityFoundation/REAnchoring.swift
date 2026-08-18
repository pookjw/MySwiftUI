// FC916BF96BDAC74B3A7A290D22B58BC6
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __REAnchoring {
    public var type: __REAnchoringType? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @safe @_hasMissingDesignatedInitializers public class Registration {
        let introspectionStruct: Swift.OpaquePointer
        final public let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "REAnchoring"
            let componentName = "MREAnchoring"
            
            let result = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .initialize(
                        pointer.baseAddress.unsafelyUnwrapped,
                        Int32(MemoryLayout<__REAnchoring>.size),
                        nil,
                        nil
                    )
            }
            
            guard result else {
                builder.destroy()
                throw __REAnchoring.Registration.RegistrationError.builderFailed
            }
            
            "Anchoring".utf8CString.withUnsafeBufferPointer { pointer in
                unsafe builder
                    .addMemberDataTypeWithTag(
                        1,
                        pointer.baseAddress.unsafelyUnwrapped,
                        .unknown17,
                        0
                    )
            }
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __REAnchoring.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let componentType = componentName.withCString { pointer in
                let info = unsafe CoreRE::CustomComponentTypeInfo(
                    unknown0: 1,
                    unknown1: pointer,
                    unknown2: 0,
                    unknown3: { p1 in
                        return unsafe createAnchoringComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown4: { p1, p2 in
                        unsafe destroyAnchoringComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self),
                            rawPointer: p2
                        )
                    },
                    unknown5: { p1 in
                        unsafe didAddAnchoringComponentObject(
                            componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown6: { p1 in
                        unsafe willRemoveAnchoringComponentObject(
                            componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
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
                throw __REAnchoring.Registration.RegistrationError.builderFailed
            }
            
            unsafe componentType.setCloneCallback { p1 in
                let result = unsafe cloneAnchoringComponent(
                    unsafeBitCast(p1, to: OpaquePointer.self)
                )
                
                return unsafe unsafeBitCast(result, to: UnsafeMutableRawPointer.self)
            }
            
            unsafe self.componentType = unsafeBitCast(componentType, to: OpaquePointer.self)
            builder.destroy()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public fileprivate(set) static nonisolated(unsafe) var registration: __REAnchoring.Registration?
}

extension __REAnchoring.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

extension __REAnchoring : RegisterableComponent {
    static func register() throws {
        unsafe __REAnchoring.registration = try __REAnchoring.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}

fileprivate nonisolated func createAnchoringComponentObject(componentType: OpaquePointer) -> UnsafeMutableRawPointer {
    assertUnimplemented()
}

fileprivate nonisolated func destroyAnchoringComponentObject(componentType: OpaquePointer, rawPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}

fileprivate nonisolated func didAddAnchoringComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func willRemoveAnchoringComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func cloneAnchoringComponent(_: OpaquePointer) -> OpaquePointer {
    assertUnimplemented()
}
