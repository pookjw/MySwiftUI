@available(visionOS, introduced: 1.0, deprecated: 26.0)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen @MainActor @preconcurrency public struct TupleAttachmentContent<T> : AttachmentContent, PrimitiveAttachmentContent {
    @usableFromInline
    /*@MainActor @preconcurrency*/ @safe internal nonisolated(unsafe) var content: T
    @inlinable /*@MainActor @preconcurrency*/ nonisolated internal init(_ content: T) {
        self.content = content
    }
    
    @MainActor @preconcurrency public static func _makeAttachmentList(content: TupleAttachmentContent<T>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
        assertUnimplemented()
    }
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, introduced: 1.0, deprecated: 26.0)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Body = Never
}

@available(visionOS, introduced: 1.0, deprecated: 26.0)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension TupleAttachmentContent : Sendable {}
