public import MySwiftUICore

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct RealityViewDefaultPlaceholder : View {
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension RealityViewDefaultPlaceholder : Sendable {}
