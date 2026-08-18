// 08848491CF12AF39E75364F344D10AC2
private import Foundation
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityUUIDComponent {
    @safe @_hasMissingDesignatedInitializers public class Registration {
        private let introspectionStruct: OpaquePointer
        private let syncInfoContextPointer: UnsafeMutablePointer<SyncInfoContext>
        final public let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "RAUUID"
            let componentName = "MRAUUID"
            
            let result = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                return unsafe builder
                    .initialize(
                        pointer.baseAddress.unsafelyUnwrapped,
                        Int32(MemoryLayout<__RKEntityUUIDComponent>.size),
                        nil,
                        nil
                    )
            }
            
            guard result else {
                builder.destroy()
                throw __RKEntityUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            "uuid".utf8CString.withUnsafeBufferPointer { pointer in
                unsafe builder
                    .addMemberCStyleArrayDataTypeWithTag(
                        1,
                        pointer.baseAddress.unsafelyUnwrapped,
                        .unknown2,
                        0,
                        0x10
                    )
            }
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __RKEntityUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let syncInfoContextPointer = UnsafeMutablePointer<SyncInfoContext>.allocate(capacity: 1)
            unsafe self.syncInfoContextPointer = syncInfoContextPointer
            unsafe syncInfoContextPointer.initialize(
                to: SyncInfoContext(
                    write: { _, _, _, _ in
                        // $s17RealityFoundation15SyncInfoContext33_08848491CF12AF39E75364F344D10AC2LLVyAD0A3Kit23__RKEntityUUIDComponentVmcfcSbs13OpaquePointerV_A2ISvtcfU_
                        assertUnimplemented()
                    },
                    read: { _, _, _, _, _ in
                        // $s17RealityFoundation15SyncInfoContext33_08848491CF12AF39E75364F344D10AC2LLVyAD0A3Kit23__RKEntityUUIDComponentVmcfcSbs13OpaquePointerV_A2ISVs5Int64VtcfU0_
                        assertUnimplemented()
                    }
                )
            )
            
            let componentType = componentName.withCString { pointer_1 in
                let context = CoreRE::CustomComponentTypeInfoContext(
                    unknown0: 0x30,
                    unknown1: 1,
                    unknown2: syncInfoContextPointer,
                    unknown3: { p1, p2, p3, p4, p5 in
                        return unsafe writeCallback(
                            syncInfoContextRawPointer: p1,
                            entity: unsafeBitCast(p2, to: OpaquePointer.self),
                            component: unsafeBitCast(p3, to: OpaquePointer.self),
                            componentType: unsafeBitCast(p4, to: OpaquePointer.self),
                            outBuffer: p5
                        )
                    },
                    unknown4: { p1, p2, p3, p4, p5, p6 in
                        return unsafe readCallback(
                            syncInfoContextRawPointer: p1,
                            entity: unsafeBitCast(p2, to: OpaquePointer.self),
                            component: unsafeBitCast(p3, to: OpaquePointer.self),
                            componentType: unsafeBitCast(p4, to: OpaquePointer.self),
                            snapshotBuffer: p5,
                            snapshotBufferLen: p6
                        )
                    },
                    unknown5: true
                )
                
                return withUnsafePointer(to: context) { pointer_2 in
                    let info = unsafe CoreRE::CustomComponentTypeInfo(
                        unknown0: 2,
                        unknown1: pointer_1,
                        unknown2: 0,
                        unknown3: { p1 in
                            return unsafe createEntityUUIDComponentObject(
                                componentType: unsafeBitCast(p1, to: OpaquePointer.self)
                            )
                        },
                        unknown4: { p1, p2 in
                            unsafe destroyEntityUUIDComponentObject(
                                componentType: unsafeBitCast(p1, to: OpaquePointer.self),
                                rawPointer: p2
                            )
                        },
                        unknown5: { p1 in
                            unsafe didAddEntityUUIDComponentObject(
                                componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                            )
                        },
                        unknown6: { p1 in
                            unsafe willRemoveEntityUUIDComponentObject(
                                componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                            )
                        },
                        unknown7: nil,
                        unknown8: 0,
                        unknown9: introspection,
                        unknown10: pointer_2
                    )
                    
                    return withUnsafePointer(to: info) { pointer in
                        return unsafe CoreRE::Component.ClassPtr.createCustomComponentType(
                            info: pointer
                        )
                    }
                }
            }
            
            guard let componentType else {
                builder.destroy()
                throw __RKEntityUUIDComponent.Registration.RegistrationError.builderFailed
            }
            
            self.componentType = unsafe unsafeBitCast(componentType, to: OpaquePointer.self)
            builder.destroy()
        }
        
        deinit {
            assertUnimplemented()
        }
    }
    
    public fileprivate(set) static var registration: __RKEntityUUIDComponent.Registration?
}

extension __RKEntityUUIDComponent.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

extension __RKEntityUUIDComponent : RegisterableComponent {
    static func register() throws {
        unsafe __RKEntityUUIDComponent.registration = try __RKEntityUUIDComponent.Registration()
    }
    
    static func unregister() {
        assertUnimplemented()
    }
}

@safe fileprivate struct SyncInfoContext {
    let write: (
        OpaquePointer,
        OpaquePointer,
        OpaquePointer,
        UnsafeMutableRawPointer
    ) -> Bool
    
    let read: (
        OpaquePointer,
        OpaquePointer,
        OpaquePointer,
        UnsafeMutableRawPointer,
        Int64
    ) -> Bool
}

extension SyncInfoContext {
    struct Buffer {
        private var inlineTag: UInt8
        private var uuid: UUID
        private var endOfFileTag: UInt8
    }
}

fileprivate nonisolated func readCallback(
    syncInfoContextRawPointer: UnsafeMutableRawPointer?,
    entity: OpaquePointer,
    component: OpaquePointer,
    componentType: OpaquePointer,
    snapshotBuffer: UnsafeRawPointer,
    snapshotBufferLen: Int64
) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func writeCallback(
    syncInfoContextRawPointer: UnsafeMutableRawPointer?,
    entity: OpaquePointer,
    component: OpaquePointer,
    componentType: OpaquePointer,
    outBuffer: UnsafeMutableRawPointer
) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func createEntityUUIDComponentObject(componentType: OpaquePointer) -> UnsafeMutableRawPointer {
    assertUnimplemented()
}

fileprivate nonisolated func destroyEntityUUIDComponentObject(componentType: OpaquePointer, rawPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}

fileprivate nonisolated func didAddEntityUUIDComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func willRemoveEntityUUIDComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}
