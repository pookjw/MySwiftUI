@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Never : AttachmentContent {
    @MainActor @preconcurrency public var body: Never {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: Never, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
}
