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

@available(*, unavailable)
extension ViewBuilder : Sendable {
}
