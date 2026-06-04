@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct OrthographicCameraComponent : Component, Equatable {
    public var near: Float
    
    public var far: Float
    
    public var scale: Float
    
    public var scaleDirection: CameraFieldOfViewOrientation
    
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> OrthographicCameraComponent {
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
    
    public static func == (a: OrthographicCameraComponent, b: OrthographicCameraComponent) -> Bool {
        assertUnimplemented()
    }
}
