package struct MenuStyleContext : StyleContext {
    package init() {}
    
    package static func accepts<T>(_: T.Type, at index: Int) -> Bool {
        assertUnimplemented()
    }
    
    package static func acceptsAny<each T : StyleContext>(_: repeat (each T).Type) -> Bool {
        assertUnimplemented()
    }
    
    package static func visitStyle<T>(_: inout T) where T : StyleContextVisitor {
        assertUnimplemented()
    }
    
    // TODO
}

extension ViewModifier {
    package func requiring<each T : StyleContext>(_ contexts: repeat each T) -> StaticIf<StyleContextAcceptsPredicate<(repeat each T)>, Self, EmptyModifier> {
        StaticIf(
            StyleContextAcceptsPredicate<(repeat each T)>.self,
            then: self
        )
    }
}

package protocol StyleContext {
    static func accepts<T>(_: T.Type, at index: Int) -> Bool
    static func acceptsAny<each T : StyleContext>(_: repeat (each T).Type) -> Bool
    static func visitStyle<T : StyleContextVisitor>(_: inout T)
}

extension StyleContext {
    package static func acceptsTop<T>(_: T.Type) -> Bool {
        return Self.accepts(T.self, at: 0)
    }
    
    package static func accepts<T>(_: T.Type, at index: Int) -> Bool {
        return Self.self == T.self
    }
    
    package static func acceptsAny<each T : StyleContext>(_: repeat (each T).Type) -> Bool {
        assertUnimplemented()
    }
    
    package static func visitStyle<T : StyleContextVisitor>(_: inout T) {
        assertUnimplemented()
    }
}

extension StyleContext where Self == MenuStyleContext {
    package static var menu: MenuStyleContext {
        return MenuStyleContext()
    }
}

package protocol StyleContextVisitor {
    // TODO
}
