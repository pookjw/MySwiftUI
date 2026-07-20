// 0F59DFD0F0165AB30F47E486AD5D1F7C
public import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct RealityViewAttachmentBuilderContent<Attachment, Content> : View where Attachment : AttachmentContent, Content : View {
    private var attachmentList: _AttachmentListOutputs
    private var content: (AttachmentStateController<Self.BuilderAttachment>) -> Content
    @State private var attachmentState: AttachmentStateController<Self.BuilderAttachment>
    @Environment(\.self) var environment: EnvironmentValues
    
    @MainActor @preconcurrency public var body: some View {
        let _: Void = self
            .attachmentState
            .updateAttachmentList(
                unsafeBitCast(self.makeAttachmentList(), to: [Self.BuilderAttachment].self),
                with: self.environment
            )
        
        self.content(self.attachmentState)
    }
    
    func makeAttachmentList() -> [some AttachmentProtocol] {
        assertUnimplemented()
        return Array<Self.BuilderAttachment>()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewAttachmentBuilderContent : Sendable {}

extension RealityViewAttachmentBuilderContent {
    struct BuilderAttachment : AttachmentProtocol {
        private(set) var id: AnyHashable
        private(set) var view: AnyView
    }
}
