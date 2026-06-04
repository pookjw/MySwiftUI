@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
@preconcurrency @MainActor public protocol HasSpotLight : HasTransform {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
extension HasSpotLight {
    @MainActor @preconcurrency public var light: SpotLightComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var shadow: SpotLightComponent.Shadow? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
