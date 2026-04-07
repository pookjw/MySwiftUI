@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_functionBuilder public struct ImmersiveSpaceContentBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: ImmersiveSpaceContent {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ImmersiveSpaceContentBuilder: Sendable {}
