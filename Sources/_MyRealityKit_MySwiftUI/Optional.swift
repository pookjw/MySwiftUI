@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Optional : AttachmentContent where Wrapped : AttachmentContent {
    @MainActor @preconcurrency public var body: Never {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: Optional<Wrapped>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
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
