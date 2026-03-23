@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubviewsCollection: RandomAccessCollection {
    public func index(before i: Int) -> Int {
        assertUnimplemented()
    }

    public func index(after i: Int) -> Int {
        assertUnimplemented()
    }

    public subscript(index: Int) -> Subview {
        assertUnimplemented()
    }

    public subscript(bounds: Range<Int>) -> SubviewsCollectionSlice {
        assertUnimplemented()
    }

    public var startIndex: Int {
        assertUnimplemented()
    }

    public var endIndex: Int {
        assertUnimplemented()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = Subview
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<SubviewsCollection>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = SubviewsCollectionSlice
}

@available(*, unavailable)
extension SubviewsCollection: Sendable {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubviewsCollectionSlice: RandomAccessCollection {
    public subscript(index: Int) -> Subview {
        assertUnimplemented()
    }

    public subscript(bounds: Range<Int>) -> SubviewsCollectionSlice {
        assertUnimplemented()
    }

    public var startIndex: Int {
        assertUnimplemented()
    }

    public var endIndex: Int {
        assertUnimplemented()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = Subview
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<SubviewsCollectionSlice>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = SubviewsCollectionSlice
}

@available(*, unavailable)
extension SubviewsCollectionSlice: Sendable {}
