@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct RealityViewAttachments {
    public func entity(for id: some Hashable) -> ViewAttachmentEntity? {
        assertUnimplemented()
    }
}
