@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen @MainActor @preconcurrency public struct TuplePackAttachmentContent<each T> : AttachmentContent, PrimitiveAttachmentContent where repeat each T : AttachmentContent {
    @usableFromInline
    /*@MainActor @preconcurrency*/ @safe internal nonisolated(unsafe) var content: (repeat each T)
    @inlinable /*@MainActor @preconcurrency*/ nonisolated internal init(_ content: repeat each T) {
        self.content = (repeat each content)
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: TuplePackAttachmentContent<repeat each T>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = Never
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension TuplePackAttachmentContent : Sendable {}
