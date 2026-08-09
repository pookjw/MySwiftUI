public import MySwiftUICore
public import MyRealityKit
#if RealityKitCompataibility
private import RealityKit
private import CoreRE
#endif

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    @MainActor public var realityKitScene: MyRealityFoundation::Scene? {
#if RealityKitCompataibility
        guard let scene = self.realityScene else {
            return nil
        }
        
        let ref = unsafe scene.__coreScene.__as(OpaquePointer.self)
        let casted = unsafe unsafeBitCast(ref, to: CoreRE::Scene.self)
        return casted.myRealityKitRef ?? MyRealityFoundation::Scene(coreScene: ref)
#else
        assertUnimplemented()
#endif
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
