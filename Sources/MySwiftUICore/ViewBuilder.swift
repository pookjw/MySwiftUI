#warning("TODO")

@_functionBuilder public struct ViewBuilder {
    @_alwaysEmitIntoClient public static func buildExpression<Content>(_ content: Content) -> Content where Content : View {
        content
    }
    
    @_alwaysEmitIntoClient public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    @_alwaysEmitIntoClient public static func buildBlock<Content>(_ content: Content) -> Content where Content : View {
        content
    }
    
    @_disfavoredOverload @_alwaysEmitIntoClient public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleView<(repeat each Content)> where repeat each Content : View {
        TupleView((repeat each content))
    }
}

extension ViewBuilder {
    @_alwaysEmitIntoClient public static func buildIf<Content>(_ content: Content?) -> Content? where Content : View {
        content
    }
    
//    @_alwaysEmitIntoClient public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View {
//        .init(storage: .trueContent(first))
//    }
//    
//    @_alwaysEmitIntoClient public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View {
//        .init(storage: .falseContent(second))
//    }
}

extension ViewBuilder {
    @_alwaysEmitIntoClient public static func buildLimitedAvailability<Content>(_ content: Content) -> AnyView where Content : View {
        .init(content)
    }
}

@available(*, unavailable)
extension ViewBuilder : Sendable {
}
