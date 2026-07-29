public import MySwiftUICore
public import MyRealityKit
private import RealityKit

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    public var realityKitScene: MyRealityFoundation::Scene? {
        guard let scene = self.realityScene else {
            return nil
        }
        
        let ref = unsafe scene.__coreScene.__as(OpaquePointer.self)
        return unsafe MyRealityFoundation::Scene(coreScene: ref)
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    public var realityViewCameraControls: MyRealityFoundation::CameraControls {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
