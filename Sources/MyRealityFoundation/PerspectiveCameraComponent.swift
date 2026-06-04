@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct PerspectiveCameraComponent : Component, Equatable {
    public var near: Float
    
    public var far: Float
    
    public var fieldOfViewInDegrees: Float
    
    @available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, *)
    public var fieldOfViewOrientation: CameraFieldOfViewOrientation
    
    public init(near: Float = 0.01, far: Float = .infinity, fieldOfViewInDegrees: Float = 60.0) {
        assertUnimplemented()
    }
    
    @available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, *)
    public init(near: Float = 0.01, far: Float = .infinity, fieldOfViewInDegrees: Float = 60.0, fieldOfViewOrientation: CameraFieldOfViewOrientation = .vertical) {
        assertUnimplemented()
    }
    
    public static func == (a: PerspectiveCameraComponent, b: PerspectiveCameraComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension PerspectiveCameraComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> PerspectiveCameraComponent {
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
