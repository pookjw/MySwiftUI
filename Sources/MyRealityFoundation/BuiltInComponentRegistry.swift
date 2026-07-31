@safe final class BuiltInComponentRegistry {
    private var componentInfoByType: [ObjectIdentifier : ComponentInfo] = Dictionary()
    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo] = Dictionary()
    
    func register(_: ComponentInfo) {
        assertUnimplemented()
    }
    
    var allComponentInfo: [ComponentInfo] {
        assertUnimplemented()
    }
    
    func componentInfo(for component: (any MyRealityFoundation::Component.Type)) -> ComponentInfo? {
        assertUnimplemented()
    }
    
    func componentInfo(forClassOpaquePointer: OpaquePointer) -> ComponentInfo? {
        assertUnimplemented()
    }
    
    func componentInfo(ofComponentsAccessableAs access: ComponentInfo.Access) -> [ComponentInfo] {
        assertUnimplemented()
    }
}
