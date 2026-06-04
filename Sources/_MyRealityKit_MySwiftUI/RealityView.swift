public import MySwiftUICore

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
@MainActor @preconcurrency public struct RealityView<Content> : View where Content : View {
    public typealias DefaultPlaceholder = RealityViewDefaultPlaceholder
    
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
    nonisolated public init<A>(make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void, update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil, @AttachmentContentBuilder attachments: @escaping () -> A) where Content == RealityViewAttachmentBuilderContent<A, RealityViewContent.Body<RealityViewDefaultPlaceholder>>, A : AttachmentContent {
        assertUnimplemented()
    }
    
    nonisolated public init<A, P>(make: @escaping @MainActor @Sendable (inout RealityViewContent, RealityViewAttachments) async -> Void, update: (@MainActor (inout RealityViewContent, RealityViewAttachments) -> Void)? = nil, @ViewBuilder placeholder: () -> P, @AttachmentContentBuilder attachments: @escaping () -> A) where Content == RealityViewAttachmentBuilderContent<A, RealityViewContent.Body<P>>, A : AttachmentContent, P : View {
        assertUnimplemented()
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
