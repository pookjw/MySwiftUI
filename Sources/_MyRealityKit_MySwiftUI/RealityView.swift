public import MySwiftUICore

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct RealityView<Content> : View where Content : View {
    public typealias DefaultPlaceholder = RealityViewDefaultPlaceholder
    
    private var _body: Content
    
    @MainActor @preconcurrency public var body: some View {
        _body
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityView {
    @available(visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init<P>(make: @escaping @MainActor @Sendable (inout RealityViewContent) async -> Void, update: (@MainActor (inout RealityViewContent) -> Void)? = nil, @ViewBuilder placeholder: () -> P) where Content == RealityViewContent.Body<P>, P : View {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init(make: @escaping @MainActor @Sendable (inout RealityViewContent) async -> Void, update: (@MainActor (inout RealityViewContent) -> Void)? = nil) where Content == RealityViewContent.Body<RealityViewDefaultPlaceholder> {
        assertUnimplemented()
    }
}

@available(visionOS, unavailable, message: "Use the `Attachment` type to define RealityView attachments rather than using Views directly.")
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityView {
    @available(visionOS, unavailable, message: "Use the `Attachment` type to define RealityView attachments rather than using Views directly.")
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init<A>(make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void, update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil, @ViewBuilder attachments: @escaping () -> A) where Content == RealityViewAttachmentContent<A, RealityViewContent.Body<RealityViewDefaultPlaceholder>>, A : View {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable, message: "Use the `Attachment` type to define RealityView attachments rather than using Views directly.")
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init<A, P>(make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void, update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil, @ViewBuilder placeholder: () -> P, @ViewBuilder attachments: @escaping () -> A) where Content == RealityViewAttachmentContent<A, RealityViewContent.Body<P>>, A : View, P : View {
        assertUnimplemented()
    }
    
    public typealias _AttachmentContent<A, P> = RealityViewAttachmentContent<A, RealityViewContent.Body<P>> where A : View, P : View
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityView {
    nonisolated public init<A>(
        make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void,
        update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil,
        @AttachmentContentBuilder attachments: @escaping () -> A
    ) where Content == RealityViewAttachmentBuilderContent<A, RealityViewContent.Body<RealityViewDefaultPlaceholder>>, A : AttachmentContent {
        assertUnimplemented()
    }
    
    nonisolated public init<A, P>(
        make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void,
        update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil,
        @ViewBuilder placeholder: () -> P,
        @AttachmentContentBuilder attachments: @escaping () -> A
    ) where Content == RealityViewAttachmentBuilderContent<A, RealityViewContent.Body<P>>, A : AttachmentContent, P : View {
        /*
         make -> x0/x1 -> x29 - 0x98 / x29 - 0x88
         update -> x2/x3 -> x29 - 0x80 / x29 - 0x78
         placeholder -> x4/x5
         attachments -> x6/x7 -> x29 - 0xa8 / x29 - 0x90
         */
        // <+184>
        // x28
        let placeholder = placeholder()
        // x21
        let attachments = attachments()
        // x29 - 0x60
        let attachmentList = A._makeAttachmentList(content: attachments, inputs: _AttachmentListInputs())
        // x23
        let copy_1 = placeholder
        
        // x29 - 0x70
        let content = RealityViewAttachmentBuilderContent<A, RealityViewContent.Body<P>>(
            attachmentList: attachmentList
        ) { controller in
            // $s19_RealityKit_SwiftUI0A4ViewV4make6update11placeholder11attachmentsACyAA0aE24AttachmentBuilderContentVyqd__AA0aeL0V4BodyVy_qd_0_GGGyAKz_AA0aE11AttachmentsVtYaYbScMYcc_yAKz_ARtScMYccSgqd_0_yXEqd__yctcAORszAA0jL0Rd__0cD00E0Rd_0_r0_lufcAnA0J15StateControllerCyAI0kJ0Vyqd__AN_GGcfU_TA
            RealityViewContent.Body(
                placeholder: copy_1,
                controller: controller,
                make: { content in
                    // $s19_RealityKit_SwiftUI0A4ViewV4make6update11placeholder11attachmentsACyAA0aE24AttachmentBuilderContentVyqd__AA0aeL0V4BodyVy_qd_0_GGGyAKz_AA0aE11AttachmentsVtYaYbScMYcc_yAKz_ARtScMYccSgqd_0_yXEqd__yctcAORszAA0jL0Rd__0cD00E0Rd_0_r0_lufcAnA0J15StateControllerCyAI0kJ0Vyqd__AN_GGcfU_yAKzYaYbScMYccfU_TY0_
                    let entities = controller.entities
                    await make(&content, entities)
                },
                update: { content in
                    // $s19_RealityKit_SwiftUI0A4ViewV4make6update11placeholder11attachmentsACyAA0aE24AttachmentBuilderContentVyqd__AA0aeL0V4BodyVy_qd_0_GGGyAKz_AA0aE11AttachmentsVtYaYbScMYcc_yAKz_ARtScMYccSgqd_0_yXEqd__yctcAORszAA0jL0Rd__0cD00E0Rd_0_r0_lufcAnA0J15StateControllerCyAI0kJ0Vyqd__AN_GGcfU_yAKzScMYccfU0_
                    if let update {
                        let entities = controller.entities
                        update(&content, entities)
                    }
                },
                strongModel: _RealityViewModel()
            )
        }
        
        self._body = content
    }
}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension RealityView {
    @available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public init<P>(make: @escaping @MainActor @Sendable (inout RealityViewCameraContent) async -> Void, update: (@MainActor (inout RealityViewCameraContent) -> Void)? = nil, @ViewBuilder placeholder: () -> P) where Content == RealityViewCameraContent.Body<P>, P : View {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public init(make: @escaping @MainActor @Sendable (inout RealityViewCameraContent) async -> Void, update: (@MainActor (inout RealityViewCameraContent) -> Void)? = nil) where Content == RealityViewCameraContent.Body<RealityViewDefaultPlaceholder> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension RealityView : Sendable {}
