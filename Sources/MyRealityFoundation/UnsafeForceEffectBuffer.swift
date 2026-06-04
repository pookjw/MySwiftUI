@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct UnsafeForceEffectBuffer<T> : Sequence {
    public subscript(index: Int) -> T {
        get {
            assertUnimplemented()
        }
    }
    
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> T? {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = T
    }
    
    public func makeIterator() -> UnsafeForceEffectBuffer<T>.Iterator {
        assertUnimplemented()
    }
    
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Element = T
}
