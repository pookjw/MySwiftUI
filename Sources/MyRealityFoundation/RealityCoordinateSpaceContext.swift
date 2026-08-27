@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct __RealityCoordinateSpaceContext {
    var camera: MyRealityFoundation::Entity?
    
    package init() {
        self.camera = nil
    }
    
    package init(camera: MyRealityFoundation::Entity?) {
        self.camera = camera
    }
}
