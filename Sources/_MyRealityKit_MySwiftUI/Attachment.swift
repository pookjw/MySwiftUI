public import MySwiftUICore

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public struct Attachment<Content> where Content : View {
    @MainActor @preconcurrency public var id: AnyHashable
    @MainActor @preconcurrency public var content: Content
    nonisolated public init(id: AnyHashable, @ViewBuilder _ content: @escaping () -> Content) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: Attachment<Content>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = Never
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Attachment : AttachmentContent, PrimitiveAttachmentContent {}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Attachment : Sendable {}
