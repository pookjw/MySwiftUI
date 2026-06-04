@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable, introduced: 26.0)
@preconcurrency @MainActor public protocol HasBodyTracking : HasTransform {
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable, introduced: 26.0)
extension HasBodyTracking {
    @MainActor @preconcurrency public var bodyTracking: BodyTrackingComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
