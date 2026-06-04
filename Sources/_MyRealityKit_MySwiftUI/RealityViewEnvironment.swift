@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewEnvironment : Sendable {
    public static var `default`: RealityViewEnvironment {
        get {
            assertUnimplemented()
        }
    }
    
    public static func skybox(_ skybox: EnvironmentResource) -> RealityViewEnvironment {
        assertUnimplemented()
    }
}
