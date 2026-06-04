@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct __SkyboxComponent : Component, Equatable {
    public var environment: EnvironmentResource?
    
    public init() {
        assertUnimplemented()
    }
    
    public init(environment: EnvironmentResource?) {
        assertUnimplemented()
    }
    
    public static func == (lhs: __SkyboxComponent, rhs: __SkyboxComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __SkyboxComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> __SkyboxComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
