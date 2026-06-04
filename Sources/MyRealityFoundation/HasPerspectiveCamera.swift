@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasPerspectiveCamera : HasTransform {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasPerspectiveCamera {
    @MainActor @preconcurrency public var camera: PerspectiveCameraComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
