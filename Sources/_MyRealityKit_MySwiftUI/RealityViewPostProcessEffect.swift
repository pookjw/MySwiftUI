@available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewPostProcessEffect : Sendable {
    public static var none: RealityViewPostProcessEffect {
        get {
            assertUnimplemented()
        }
    }
    
    public static func effect(_ object: some PostProcessEffect) -> RealityViewPostProcessEffect {
        assertUnimplemented()
    }
}
