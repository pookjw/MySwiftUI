// 1558257BADCADEB3C5B113F1E1919F41
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityInteractionsComponent {
    @safe @_hasMissingDesignatedInitializers public class Registration {
        private let introspectionStruct: OpaquePointer
        final public let componentType: OpaquePointer
        
        init() throws {
            let builder = CoreRE::StructBuilder()
//            let componentName = "RAInteractions
            let componentName = "MRAInteractions"
            
            let result = unsafe builder.initialize(
                componentName,
                Int32(MemoryLayout<__RKEntityInteractionsComponent>.size),
                nil,
                nil
            )
            
            guard result else {
                builder.destroy()
                throw __RKEntityInteractionsComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe builder.addMemberDataTypeWithTag(1, "specifications", .unknown17, 0)
            
            guard let introspection = builder.registerIntrospectionStruct() else {
                builder.destroy()
                throw __RKEntityInteractionsComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe self.introspectionStruct = unsafeBitCast(introspection, to: OpaquePointer.self)
            
            let componentType = componentName.utf8CString.withUnsafeBufferPointer { pointer in
                let info = unsafe CoreRE::CustomComponentTypeInfo(
                    unknown0: 1,
                    unknown1: pointer.baseAddress.unsafelyUnwrapped,
                    unknown2: nil,
                    unknown3: { p1 in
                        return unsafe createInteractionsComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown4: { p1, p2 in
                        return unsafe destroyInteractionsComponentObject(
                            componentType: unsafeBitCast(p1, to: OpaquePointer.self),
                            rawPointer: p2
                        )
                    },
                    unknown5: { p1 in
                        return unsafe didAddInteractionsComponentObject(
                            componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown6: { p1 in
                        return unsafe willRemoveInteractionsComponentObject(
                            componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown7: { p1 in
                        return unsafe interactionsComponentEntityDidActivate(
                            componentRef: unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    },
                    unknown8: 0,
                    unknown9: introspection,
                    unknown10: nil
                )
                
                return withUnsafePointer(to: info) { pointer in
                    return unsafe CoreRE::Component.ClassPtr.createCustomComponentType(pointer)
                }
            }
            
            // x23
            guard let componentType else {
                builder.destroy()
                throw __RKEntityInteractionsComponent.Registration.RegistrationError.builderFailed
            }
            
            unsafe componentType.setCloneCallback { pointer in
                let result = unsafe cloneInteractionsComponentComponent(
                    unsafeBitCast(pointer, to: OpaquePointer.self)
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
    
    @safe public static nonisolated(unsafe) var registration: __RKEntityInteractionsComponent.Registration?
    
    public static var componentType: OpaquePointer? {
        return unsafe __RKEntityInteractionsComponent.registration?.componentType
    }
    
    private var jsonRawPointer: UnsafeMutableRawPointer?
    private var cleanupHelper: IntrospectionDataCleanupHelper?
    fileprivate private(set) var internalSpecifications: [__RKEntityInteractionSpecification]?
    private var internalInteractions: [__RKEntityInteraction]?
    private weak var  entity: Entity?
    private var didFireStartTrigger: Bool?
    
    fileprivate func decodedJSON() -> [__RKEntityInteractionSpecification] {
        assertUnimplemented()
    }
}

extension __RKEntityInteractionsComponent.Registration {
    enum RegistrationError : Error {
        case builderFailed
    }
}

fileprivate nonisolated func createInteractionsComponentObject(componentType: OpaquePointer) -> UnsafeMutableRawPointer {
    assertUnimplemented()
}

fileprivate nonisolated func destroyInteractionsComponentObject(componentType: OpaquePointer, rawPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}

fileprivate nonisolated func didAddInteractionsComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func willRemoveInteractionsComponentObject(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func interactionsComponentEntityDidActivate(componentRef: OpaquePointer) {
    assertUnimplemented()
}

fileprivate nonisolated func cloneInteractionsComponentComponent(_: OpaquePointer) -> OpaquePointer {
    assertUnimplemented()
}

extension Entity {
    static func updateInteractions(root: Entity) {
        // entity -> x0 -> x20
        if
            let disableUpdateInteractionEntities = Entity.__disableUpdateInteractionEntities,
            disableUpdateInteractionEntities.contains(root)
        {
            return
        }
        
        // <+112>
        let specification: [__RKEntityInteractionSpecification]
        if
            let registration = __RKEntityInteractionsComponent.registration,
            let component = unsafe unsafeBitCast(root.coreEntity, to: CoreRE::Entity.self)
                .customComponent(unsafeBitCast(registration.componentType, to: CoreRE::Component.ClassPtr.self)),
            let object = unsafe component.customComponentObject
        {
            let component = unsafe object
                .assumingMemoryBound(to: __RKEntityInteractionsComponent.self)
                .pointee
            
            specification = component.internalSpecifications ?? component.decodedJSON()
        } else {
            specification = []
        }
        
        // <+200>
        assertUnimplemented()
    }
}
