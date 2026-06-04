@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
@preconcurrency @MainActor public protocol HasDirectionalLight : HasTransform {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
extension HasDirectionalLight {
    @MainActor @preconcurrency public var light: DirectionalLightComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var shadow: DirectionalLightComponent.Shadow? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
