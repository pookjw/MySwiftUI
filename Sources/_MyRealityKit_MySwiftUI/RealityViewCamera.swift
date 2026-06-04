@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewCamera : Sendable {
    public static var virtual: RealityViewCamera {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, *)
@available(macCatalyst, unavailable, introduced: 18.0)
@available(macOS, unavailable, introduced: 15.0)
@available(visionOS, unavailable, introduced: 2.0)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewCamera {
    public static var spatialTracking: RealityViewCamera {
        get {
            assertUnimplemented()
        }
    }
}
