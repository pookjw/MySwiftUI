@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public protocol RealityCoordinateSpace {
    func _resolve(in context: __RealityCoordinateSpaceContext) -> __ResolvedRealityCoordinateSpace
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension RealityCoordinateSpace where Self == SceneRealityCoordinateSpace {
    @_alwaysEmitIntoClient public static var scene: SceneRealityCoordinateSpace {
        get { SceneRealityCoordinateSpace() }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension RealityCoordinateSpace where Self == CameraRealityCoordinateSpace {
    @_alwaysEmitIntoClient public static var camera: CameraRealityCoordinateSpace {
        get { CameraRealityCoordinateSpace() }
    }
}
