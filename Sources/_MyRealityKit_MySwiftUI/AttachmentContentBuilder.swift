@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@_functionBuilder public struct AttachmentContentBuilder {
    @_alwaysEmitIntoClient public static func buildExpression<Content>(_ content: Content) -> Content where Content : AttachmentContent {
        content
    }
    
    @_alwaysEmitIntoClient public static func buildBlock() -> EmptyAttachmentContent {
        EmptyAttachmentContent()
    }
    
    @_alwaysEmitIntoClient public static func buildBlock<C>(_ content: C) -> C where C : AttachmentContent {
        content
    }
    
    @_alwaysEmitIntoClient public static func buildIf<Content>(_ content: Content?) -> Content? where Content : AttachmentContent {
        content
    }
    
    @_alwaysEmitIntoClient public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalAttachmentContent<TrueContent, FalseContent> where TrueContent : AttachmentContent, FalseContent : AttachmentContent {
        ConditionalAttachmentContent(trueContent: first, falseType: FalseContent.self)
    }
    
    @_alwaysEmitIntoClient public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalAttachmentContent<TrueContent, FalseContent> where TrueContent : AttachmentContent, FalseContent : AttachmentContent {
        ConditionalAttachmentContent(falseContent: second, trueType: TrueContent.self)
    }
    
    @available(visionOS 2.0, *)
    @_alwaysEmitIntoClient public static func buildLimitedAvailability(_ content: any AttachmentContent) -> some AttachmentContent {
        if #unavailable(visionOS 2.0) {
            return EmptyAttachmentContent()
        } else {
            return AnyAttachmentContent(content)
        }
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 1.0, obsoleted: 2.0, message: "This code may crash on earlier versions of the OS; either specify '#available(visionOS 2.0, *)' or newer, or add 'if #available' version check around the View instead")
    @_alwaysEmitIntoClient public static func buildLimitedAvailability<Content>(_ content: Content) -> some AttachmentContent where Content : AttachmentContent {
        content
    }
    
    @available(visionOS, introduced: 1.0, obsoleted: 26.0)
    @_disfavoredOverload @_alwaysEmitIntoClient public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleAttachmentContent<(repeat each Content)> where repeat each Content : AttachmentContent {
        TupleAttachmentContent((repeat each content))
    }
    
    @available(visionOS 26.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient public static func buildBlock<each Content>(_ content: repeat each Content) -> TuplePackAttachmentContent<repeat each Content> where repeat each Content : AttachmentContent {
        TuplePackAttachmentContent(repeat each content)
    }
}
