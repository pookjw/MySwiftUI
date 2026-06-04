@available(iOS 13.4, macCatalyst 14.0, visionOS 1.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(tvOS, unavailable, introduced: 26.0)
@preconcurrency @MainActor public protocol HasSceneUnderstanding : Entity {
}

@available(iOS 13.4, macCatalyst 14.0, visionOS 1.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(tvOS, unavailable, introduced: 26.0)
extension HasSceneUnderstanding {
    @MainActor @preconcurrency public var sceneUnderstanding: SceneUnderstandingComponent {
        get {
            assertUnimplemented()
        }
    }
}
