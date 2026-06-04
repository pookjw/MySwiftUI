@available(macOS 26.0, iOS 26.0, visionOS 26.0, tvOS 26.0, macCatalyst 26.0, *)
public struct MeshInstancesComponent : Component {
    public struct Part {
        public var data: LowLevelInstanceData
        
        public var bounds: BoundingBox?
        
        public init(data: LowLevelInstanceData, bounds: BoundingBox? = nil) {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(mesh: MeshResource, modelID: String? = nil, instances: LowLevelInstanceData, bounds: BoundingBox? = nil) throws {
        assertUnimplemented()
    }
    
    public subscript(partIndex partIndex: Int) -> MeshInstancesComponent.Part? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> MeshInstancesComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
}
