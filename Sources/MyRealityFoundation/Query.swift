@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct EntityQuery : @unchecked Sendable {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init() {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(where predicate: QueryPredicate<Entity>) {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct QueryResult<Element> {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension QueryResult : Sequence {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> Element? {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public func makeIterator() -> QueryResult<Element>.Iterator {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct QueryPredicate<Value> {
}

extension QueryPredicate {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static func has<T>(_ t: T.Type) -> QueryPredicate<Entity> where T : Component {
        assertUnimplemented()
    }
}
