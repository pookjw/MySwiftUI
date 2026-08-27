@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct QueryResult<Element> : @unchecked Sendable {
    private(set) var elements: [Element]
    
    init() {
        self.elements = Array()
    }
    
    init(_ elements: [Element]) {
        self.elements = elements
    }
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
