// 2EF43D8D991A83294E93848563DD541B

struct TupleStyleContext<T> : StyleContext {
    static func accepts<U>(_: U.Type, at index: Int) -> Bool {
        assertUnimplemented()
    }
    
    static func acceptsAny<each U : StyleContext>(_: repeat (each U).Type) -> Bool {
        assertUnimplemented()
    }
    
    static func visitStyle<U : StyleContextVisitor>(_: inout U) {
        assertUnimplemented()
    }
    
    // TODO
}

extension TupleStyleContext {
    fileprivate struct QueryAtIndexVisitor<U> : StyleContextVisitor {
        // TODO
    }
    
    fileprivate struct QueryVisitor<each U> : StyleContextVisitor {
        // TODO
    }
    
    fileprivate struct ContextAcceptsVisitor<U> : StyleContextVisitor {
        // TODO
    }
}
