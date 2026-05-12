// 95C35B9B1549B6F41E131C274C6E343F

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

struct AnyStyleContextType {
    private let base: (any AnyStyleContextTypeBox.Type)
    
    init<T : StyleContext>(_ context: T.Type) {
        self.base = StyleContextTypeBox<T>.self
    }
    
    func acceptsTop<T>(_: T.Type) -> Bool {
        return base.acceptsTop(T.self)
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
        assertUnimplemented()
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
