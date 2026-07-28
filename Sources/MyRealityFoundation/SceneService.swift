// 78C7AC4C62C2AF6C307D1A28F168722B
internal import CoreRE
private import os.log
private import CoreFoundation
private import Foundation

@safe final class SceneManager {
    static func customComponentType(_ type: any MyRealityFoundation::Component.Type) -> OpaquePointer {
        /*
         type -> x0/x1 -> x19/x22
         */
        if let componentType = unsafe SceneManager.customComponentTypeObjectIdToHandles[ObjectIdentifier(type)] {
            return unsafe componentType
        }
        
        let componentType = unsafe SceneManager.customComponentTypeHelper(type, typeName: nil)
        // <+108>
        unsafe SceneManager.customComponentTypeObjectIdToHandles[ObjectIdentifier(type)] = componentType
        return unsafe componentType
    }
    
    private(set) var builtinComponentRegistry: BuiltInComponentRegistry
    let coreECSManager: __REECSManagerRef
    var scenes: [MyRealityFoundation::Scene]
    private var builtInComponentTypeToClassTable: [ObjectIdentifier : CoreRE::Component.ClassPtr]
    private var builtInComponentClassToTypeTable: [CoreRE::Component.ClassPtr : any Component.Type]
    
    func append(scene: MyRealityFoundation::Scene) {
        assertUnimplemented()
    }
    
    func remove(scene: MyRealityFoundation::Scene) {
        assertUnimplemented()
    }
    
    init(coreECSManager: OpaquePointer) {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
    
    static func customComponentTypeHelper(_ type: any MyRealityFoundation::Component.Type, typeName: String?) -> OpaquePointer {
        /*
         type -> x0/x1 -> x22/x21
         typeName -> x2/x3 -> x26/x24
         */
        // x28/x19
        let handleKey = SceneManager.makeComponentTypeHandleKey(type, typeName: typeName)
        
        if let componentType = unsafe SceneManager.customComponentTypesToHandles[handleKey] {
            return unsafe componentType
        }
        
        // <+176>
        // x26/x23
        let typeName_2 = typeName ?? type.__typeName
        // x20
        let size = type.__size
        // x24
        let builder = CoreRE::StructBuilder()
        // w20
        let result = typeName_2.utf8CString.withUnsafeBufferPointer { pointer in
            return unsafe builder.initialize(
                Int32(size),
                pointer.baseAddress.unsafelyUnwrapped,
                nil,
                nil
            )
        }
        
        guard result else {
            assertionFailure("Failed to create type info for custom component.")
        }
        
        // <+344>
        unsafe type.__addIntrospectionData(unsafeBitCast(builder, to: OpaquePointer?.self))
        
        // x27
        guard let introspectionStruct = builder.registerIntrospectionStruct() else {
            assertionFailure("Failed to register type info for custom component.")
        }
        
        // <+388>
        builder.destroy()
        
        // x28
        let codableType = (type as? any Codable.Type)
        // w20 -> x29 - 0x68
        let flag_1: Bool
        if codableType != nil {
            // <+436>
            flag_1 = (type as? (any DisableRESync.Type)) != nil
        } else {
            // <+556>
            flag_1 = false
        }
        
        // <+560>
        // x29 - 0x90
        let context = unsafe CoreRE::CustomComponentTypeInfoContext(
            unknown0: 0x30,
            unknown1: 1,
            unknown2: 0,
            unknown3: { p1, p2, p3, p4, p5, p6 in
                return unsafe ecsNetSyncReadSnapshot(
                    p1,
                    unsafeBitCast(p2, to: OpaquePointer.self),
                    unsafeBitCast(p3, to: OpaquePointer.self),
                    unsafeBitCast(p4, to: OpaquePointer.self),
                    p5,
                    p6
                )
            },
            unknown4: { p1, p2, p3, p4, p5 in
                return unsafe ecsNetSyncWriteSnapshot(
                    p1,
                    unsafeBitCast(p2, to: OpaquePointer.self),
                    unsafeBitCast(p3, to: OpaquePointer.self),
                    unsafeBitCast(p4, to: OpaquePointer.self),
                    p5
                )
            },
            unknown5: flag_1
        )
        
        if codableType != nil {
            // <+616>
            unsafe RERegisterSwiftCodableCallbacks(
                { p1, p2, p3 in
                    return unsafe encodeComponent(
                        unsafeBitCast(p1, to: OpaquePointer.self),
                        unsafeBitCast(p2, to: OpaquePointer.self),
                        p3
                    )
                },
                { p1, p2, p3, p4 in
                    return unsafe decodeComponent(
                        unsafeBitCast(p1, to: OpaquePointer.self),
                        unsafeBitCast(p2, to: OpaquePointer.self),
                        p3,
                        p4
                    )
                }
            )
            // <+968>
        } else {
            // <+640>
            unsafe os_log(.default, log: .default, "%s", "CustomComponent of type \(_typeName(type, qualified: false)) does not conform to Codable. Component state network sync disabled.")
            // <+968>
        }
        
        // <+968>
        // w19
        let flag_2 = (codableType != nil)
        // w20 -> w1
        let flag_3 = (type is (any TransientComponent.Type))
        // w8 -> w25
        let flag_4 = (type is (any HiddenComponent.Type))
        
        // <+1040>
        return typeName_2.withCString { pointer_1 in
            // $s17RealityFoundation12SceneManagerC25customComponentTypeHelper_8typeNames13OpaquePointerV0A3Kit0F0_pXp_SSSgtFZAGSPys4Int8VGXEfU_TA
            return withUnsafePointer(to: context) { pointer_2 in
                let info = unsafe CustomComponentTypeInfo(
                    unknown0: 2,
                    unknown1: pointer_1,
                    unknown2: 0,
                    unknown3: 0,
                    unknown4: { p1, p2 in
                        unsafe deinitComponent(
                            componentTypeHandle: unsafeBitCast(p1, to: OpaquePointer.self),
                            rawPointer: p2
                        )
                    },
                    unknown5: 0,
                    unknown6: 0,
                    unknown7: 0,
                    unknown8: 0,
                    unknown9: introspectionStruct,
                    unknown10: pointer_2
                )
                
                return withUnsafePointer(to: info) { pointer_3 in
                    // x23
                    guard let componentClass = unsafe ComponentTypeClass.createCustomComponentType(info: pointer_3, flag_3) else {
                        preconditionFailure("Could not create custom component type.")
                    }
                    
                    unsafe componentClass.setCloneCallback { p1 in
                        return unsafe cloneComponent(
                            unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                    }
                    
                    if flag_2 {
                        unsafe CoreRE::Component.registerSwiftCodableComponent("CustomComponentRealityKit.\(typeName_2)")
                    }
                    
                    // <+240>
                    if flag_4 {
                        let bundle = Bundle(for: SceneManager.self)
                        
                        unsafe type.registerBuiltin(
                            bundle: bundle,
                            reComponentClass: nil,
                            access: .internal,
                            availability: ComponentInfo.Availability(
                                introduced: [],
                                deprecated: nil,
                                obsoleted: nil
                            )
                        )
                    }
                    
                    // <+376>
                    unsafe SceneManager.customComponentTypesToHandles[typeName_2] = unsafeBitCast(componentClass, to: OpaquePointer.self)
                    unsafe SceneManager.handlesToCustomComponentTypes[unsafeBitCast(componentClass, to: OpaquePointer.self)] = type
                    
                    return unsafe unsafeBitCast(componentClass, to: OpaquePointer.self)
                }
            }
        }
    }
    
    func registerBuiltInType(_: any MyRealityFoundation::Component.Type, typeEnum: CoreRE::ComponentType) {
        assertUnimplemented()
    }
    
    func componentTypeToComponentClass(_ type: any MyRealityFoundation::Component.Type) -> OpaquePointer? {
        assertUnimplemented()
    }
    
    func componentClassToComponentType(_ componentClass: OpaquePointer) -> any MyRealityFoundation::Component.Type? {
        assertUnimplemented()
    }
    
    fileprivate static func makeComponentTypeHandleKey(_ type: MyRealityFoundation::Component.Type, typeName: String?) -> String {
        assertUnimplemented()
    }
    
    static func unregisterCustomComponents() {
        assertUnimplemented()
    }
    
    func registerBuiltInComponents() {
        assertUnimplemented()
    }
    
    static nonisolated(unsafe) var customComponentTypesToHandles: [String : OpaquePointer] = unsafe [:]
    static nonisolated(unsafe) var handlesToCustomComponentTypes: [OpaquePointer : any MyRealityFoundation::Component.Type] = unsafe [:]
    static let customComponentTypesToKeys: [ObjectIdentifier : String] = [:]
    static nonisolated(unsafe) var customComponentTypeObjectIdToHandles: [ObjectIdentifier : OpaquePointer] = unsafe [:]
}

final class BuiltInComponentRegistry {
//    private var componentInfoByType: [ObjectIdentifier : ComponentInfo]
//    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo]
}


@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __SceneService {
    var scenes: [Scene] { get }
    func append(scene: Scene)
    func remove(scene: Scene)
    var coreECSManager: __REECSManagerRef { get }
}

fileprivate nonisolated func encodeComponent(_: OpaquePointer, _: OpaquePointer, _: UnsafePointer<Int8>) -> Unmanaged<CFData>? {
    assertUnimplemented()
}

fileprivate nonisolated func decodeComponent(_: OpaquePointer, _: OpaquePointer, _: CFData, _: UnsafePointer<Int8>) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func deinitComponent(componentTypeHandle: OpaquePointer, rawPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}

fileprivate nonisolated func ecsNetSyncReadSnapshot(_: UnsafeMutableRawPointer?, _: OpaquePointer, _: OpaquePointer, _: OpaquePointer, _: UnsafeRawPointer, _: Int64) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func ecsNetSyncWriteSnapshot(_: UnsafeMutableRawPointer?, _: OpaquePointer, _: OpaquePointer, _: OpaquePointer, _: UnsafeMutableRawPointer) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func cloneComponent(_: OpaquePointer) -> OpaquePointer {
    assertUnimplemented()
}
