internal import MySwiftUICore

protocol ListStyleContext : StyleContext {
    // TODO
}

struct AnyListStyleContext : ListStyleContext {
    // TODO
    
    static func accepts<T>(_: T.Type, at index: Int) -> Bool {
        assertUnimplemented()
    }
}

extension ListStyleContext {
    static func accepts<T>(_: T.Type, at index: Int) -> Bool {
        return Self.self == AnyListStyleContext.self || Self.self == T.self
    }
}
