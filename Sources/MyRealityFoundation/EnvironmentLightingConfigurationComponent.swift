@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct EnvironmentLightingConfigurationComponent : Component, Equatable {
    public var environmentLightingWeight: Float
    
    public init(environmentLightingWeight: Float = 1.0) {
        assertUnimplemented()
    }
    
    public static func == (lhs: EnvironmentLightingConfigurationComponent, rhs: EnvironmentLightingConfigurationComponent) -> Bool {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> EnvironmentLightingConfigurationComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
