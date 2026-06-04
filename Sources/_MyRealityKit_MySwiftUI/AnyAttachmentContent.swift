@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@frozen @MainActor @preconcurrency public struct AnyAttachmentContent : AttachmentContent, PrimitiveAttachmentContent {
    @MainActor @preconcurrency internal var storage: AnyAttachmentContentStorageBase
    
    /*@MainActor @preconcurrency */ nonisolated public init<Content>(_ content: Content) where Content : AttachmentContent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: AnyAttachmentContent, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
    
    @available(visionOS 2.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = Never
}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension AnyAttachmentContent : Sendable {}
