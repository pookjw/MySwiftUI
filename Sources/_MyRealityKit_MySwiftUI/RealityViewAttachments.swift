internal import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct RealityViewAttachments {
    private(set) var entities: [AnyHashable : ViewAttachmentEntity]
    private(set) var children: _VariadicView_Children?
    
    public func entity(for id: some Hashable) -> ViewAttachmentEntity? {
        assertUnimplemented()
    }
}
