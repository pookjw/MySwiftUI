#warning("TODO")

@frozen public struct ModifiedContent<Content, Modifier> {
    public typealias Body = Never
    
    public var content: Content
    public var modifier: Modifier
    
    @inlinable public nonisolated init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

// TODO
