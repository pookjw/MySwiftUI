public import simd

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct ProjectiveTransformCameraComponent : Component, Equatable {
    public var transform: float4x4
    
    @available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, *)
    public init(projectionMatrix: float4x4) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ProjectiveTransformCameraComponent {
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
    
    public static func == (a: ProjectiveTransformCameraComponent, b: ProjectiveTransformCameraComponent) -> Bool {
        assertUnimplemented()
    }
}
