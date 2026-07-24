// 0F59DFD0F0165AB30F47E486AD5D1F7C
public import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct RealityViewAttachmentBuilderContent<Attachment, Content> : View where Attachment : AttachmentContent, Content : View {
    private var attachmentList: _AttachmentListOutputs // 0x0
    private var content: (AttachmentStateController<Self.BuilderAttachment>) -> Content // 0x10
    @State private var attachmentState: AttachmentStateController<Self.BuilderAttachment> // 0x20
    @Environment(\.self) var environment: EnvironmentValues // 0x3c (field)
    
    @MainActor @preconcurrency public var body: some View {
        let _: Void = self
            .attachmentState
            .updateAttachmentList(
                unsafeBitCast(self.makeAttachmentList(), to: [Self.BuilderAttachment].self),
                with: self.environment
            )
        
        self.content(self.attachmentState)
    }
    
    init(
        attachmentList: _AttachmentListOutputs,
        content: @escaping (AttachmentStateController<RealityViewAttachmentBuilderContent<Attachment, Content>.BuilderAttachment>) -> Content
    ) {
        self.attachmentState = AttachmentStateController<Self.BuilderAttachment>()
        self._environment = Environment(\.self)
        self.attachmentList = attachmentList
        self.content = content
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
