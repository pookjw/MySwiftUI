public import MySwiftUICore
public import MyRealityKit

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    public var realityKitScene: MyRealityKit::Scene? {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    public var realityViewCameraControls: CameraControls {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
