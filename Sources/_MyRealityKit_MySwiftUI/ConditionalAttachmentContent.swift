@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct ConditionalAttachmentContent<TrueContent, FalseContent> {
    @usableFromInline
    @frozen internal enum Storage {
        case trueContent(TrueContent)
        case falseContent(FalseContent)
    }
    
    @usableFromInline
    internal let storage: ConditionalAttachmentContent<TrueContent, FalseContent>.Storage
    
    @usableFromInline
    internal init(trueContent: TrueContent, falseType: FalseContent.Type) {
        assertUnimplemented()
    }
    
    @usableFromInline
    internal init(falseContent: FalseContent, trueType: TrueContent.Type) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ConditionalAttachmentContent : AttachmentContent, PrimitiveAttachmentContent where TrueContent : AttachmentContent, FalseContent : AttachmentContent {
    @MainActor @preconcurrency public static func _makeAttachmentList(content: ConditionalAttachmentContent<TrueContent, FalseContent>, inputs: _AttachmentListInputs) -> _AttachmentListOutputs {
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
