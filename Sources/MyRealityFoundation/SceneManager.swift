// 78C7AC4C62C2AF6C307D1A28F168722B
internal import CoreRE

@safe final class SceneManager {
    static func customComponentType(_ type: any MyRealityFoundation::Component.Type) -> OpaquePointer {
        assertUnimplemented()
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
}

final class BuiltInComponentRegistry {
//    private var componentInfoByType: [ObjectIdentifier : ComponentInfo]
//    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo]
}
