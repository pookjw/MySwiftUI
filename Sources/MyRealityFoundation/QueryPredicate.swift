@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct QueryPredicate<Value> {
}

extension QueryPredicate {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static func has<T>(_ t: T.Type) -> QueryPredicate<Entity> where T : Component {
        assertUnimplemented()
    }
}
