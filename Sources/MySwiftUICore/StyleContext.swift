// 95C35B9B1549B6F41E131C274C6E343F

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

package struct StyleContextAcceptsPredicate<T> : ViewInputPredicate {
    package init() {}
    
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        let contextInput = inputs[StyleContextInput.self]
        let result = contextInput.acceptsTop(T.self)
        return result
    }
}

package struct StyleContextAcceptsAnyPredicate<T> : ViewInputPredicate {
    package init() {}
    
    package static func evaluate(inputs: _GraphInputs) -> Bool {
        assertUnimplemented()
    }
}

struct StyleContextInput : ViewInput {
    static let defaultValue = AnyStyleContextType(NoStyleContext.self)
}

extension _GraphInputs {
    package mutating func pushStyleContext<T : StyleContext>(_ context: T) {
        let existing = self[StyleContextInput.self]
        let contextType = existing.pushing(T.self)
        self[StyleContextInput.self] = contextType
    }
}

struct AnyStyleContextType : @unchecked Sendable {
    private let base: (any AnyStyleContextTypeBox.Type)
    
    init<T : StyleContext>(_ context: T.Type) {
        self.base = StyleContextTypeBox<T>.self
    }
    
    @inline(always) // 원래 없음
    fileprivate init(base: (any AnyStyleContextTypeBox.Type)) {
        self.base = base
    }
    
    func acceptsTop<T>(_: T.Type) -> Bool {
        return base.acceptsTop(T.self)
    }
    
    func pushing<T : StyleContext>(_ type: T.Type) -> AnyStyleContextType {
        let pushed = StyleContextTypeBox<NoStyleContext>.pushing(type)
        return AnyStyleContextType(base: pushed)
    }
    
    func acceptsAny<each T>(_: repeat (each T).Type) -> Bool where repeat each T : StyleContext {
        assertUnimplemented()
    }
}

fileprivate protocol AnyStyleContextTypeBox {
    static func isEqual(to other: any AnyStyleContextTypeBox.Type)
    static func acceptsTop<T>(_: T.Type) -> Bool
    static func acceptsAny<each T : StyleContext>(_: repeat (each T).Type) -> Bool
    static func pushing<T : StyleContext>(_: T.Type) -> any AnyStyleContextTypeBox.Type
}

fileprivate struct StyleContextTypeBox<T : StyleContext> : AnyStyleContextTypeBox {
    static func isEqual(to other: any AnyStyleContextTypeBox.Type) {
        assertUnimplemented()
    }
    
    static func acceptsTop<U>(_: U.Type) -> Bool {
        return T.acceptsTop(U.self)
    }
    
    static func acceptsAny<each U : StyleContext>(_: repeat (each U).Type) -> Bool {
        assertUnimplemented()
    }
    
    static func pushing<U>(_: U.Type) -> any AnyStyleContextTypeBox.Type where U : StyleContext {
        return StyleContextTypeBox<TupleStyleContext<(U, T)>>.self
    }
    
}

struct NoStyleContext : StyleContext {
    static func acceptsAny<each T : StyleContext>(_: repeat (each T).Type) -> Bool {
        assertUnimplemented()
    }
    
    static func visitStyle<T>(_: inout T) where T : StyleContextVisitor {
        assertUnimplemented()
    }
    
    // TODO
}
