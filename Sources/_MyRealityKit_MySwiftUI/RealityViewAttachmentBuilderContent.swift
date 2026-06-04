public import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct RealityViewAttachmentBuilderContent<Attachment, Content> : View where Attachment : AttachmentContent, Content : View {
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewAttachmentBuilderContent : Sendable {}
