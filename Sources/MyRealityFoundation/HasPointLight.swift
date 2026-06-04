@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
@preconcurrency @MainActor public protocol HasPointLight : HasTransform {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
extension HasPointLight {
    @MainActor @preconcurrency public var light: PointLightComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
