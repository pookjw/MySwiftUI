@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ImageBasedLightComponent : Component, Equatable {
    public enum Source {
        case none
        case single(EnvironmentResource)
        case blend(EnvironmentResource, EnvironmentResource, Float)
    }
    
    public var source: ImageBasedLightComponent.Source
    
    public var inheritsRotation: Bool
    
    public var intensityExponent: Float
    
    public init(source: ImageBasedLightComponent.Source, intensityExponent: Float = 0) {
        assertUnimplemented()
    }
    
    public static func == (lhs: ImageBasedLightComponent, rhs: ImageBasedLightComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ImageBasedLightComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> ImageBasedLightComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS, deprecated, introduced: 15.0, renamed: "ImageBasedLightComponent")
@available(macOS, deprecated, introduced: 12.0, renamed: "ImageBasedLightComponent")
@available(macCatalyst, deprecated, introduced: 15.0, renamed: "ImageBasedLightComponent")
@available(tvOS, unavailable)
public struct __ImageBasedLightComponent : Component, Equatable {
    public var environment: EnvironmentResource?
    
    public var intensityExponent: Float
    
    public init(environment: EnvironmentResource?, intensityExponent: Float = 0) {
        assertUnimplemented()
    }
    
    public static func == (lhs: __ImageBasedLightComponent, rhs: __ImageBasedLightComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(iOS, deprecated, introduced: 15.0, renamed: "ImageBasedLightComponent")
@available(macOS, deprecated, introduced: 12.0, renamed: "ImageBasedLightComponent")
@available(macCatalyst, deprecated, introduced: 15.0, renamed: "ImageBasedLightComponent")
@available(tvOS, unavailable)
extension __ImageBasedLightComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> __ImageBasedLightComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
