@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public enum CameraFieldOfViewOrientation {
    case horizontal
    case vertical
    
    public static func == (a: CameraFieldOfViewOrientation, b: CameraFieldOfViewOrientation) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension CameraFieldOfViewOrientation : Equatable {}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension CameraFieldOfViewOrientation : Hashable {}
