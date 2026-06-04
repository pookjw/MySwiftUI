public import MySwiftUICore

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct Model3DPlaceholderContent<Model, Placeholder> : View where Model : View, Placeholder : View {
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Model3DPlaceholderContent : Sendable {}
