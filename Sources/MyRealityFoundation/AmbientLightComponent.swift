public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(tvOS, unavailable)
public struct __AmbientLightComponent : Component, Equatable {
    public var color: CGColor
    
    public var intensity: Float
    
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> __AmbientLightComponent {
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
    
    public static func == (a: __AmbientLightComponent, b: __AmbientLightComponent) -> Bool {
        assertUnimplemented()
    }
}
