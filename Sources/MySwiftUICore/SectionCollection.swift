@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SectionCollection : RandomAccessCollection {
    public subscript(index: Int) -> SectionConfiguration {
        assertUnimplemented()
    }
    
    public var startIndex: Int {
        assertUnimplemented()
    }
    
    public var endIndex: Int {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = SectionConfiguration
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<SectionCollection>
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = Slice<SectionCollection>
}

@available(*, unavailable)
extension SectionCollection : Sendable {
}
