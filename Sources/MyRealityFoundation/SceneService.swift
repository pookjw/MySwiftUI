// 78C7AC4C62C2AF6C307D1A28F168722B
internal import CoreRE

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
        assertUnimplemented()
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
    
    @safe static nonisolated(unsafe) let customComponentTypesToHandles: [String : OpaquePointer] = unsafe [:]
    @safe static nonisolated(unsafe) let handlesToCustomComponentTypes: [OpaquePointer : any MyRealityFoundation::Component.Type] = unsafe [:]
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
