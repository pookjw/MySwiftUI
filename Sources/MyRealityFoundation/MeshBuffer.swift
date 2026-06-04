@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MeshBuffer<Element> : Sequence {
    public typealias Element = Element
    
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> Element? {
            assertUnimplemented()
        }
    }
    
    public __consuming func makeIterator() -> MeshBuffer<Element>.Iterator {
        assertUnimplemented()
    }
    
    public let count: Int
    
    public var rate: MeshBuffers.Rate
    
    public var elements: [Element] {
        get {
            assertUnimplemented()
        }
    }
    
    public func usingRate(_ rate: MeshBuffers.Rate) -> MeshBuffer<Element> {
        assertUnimplemented()
    }
    
    public func forEach(_ body: (Element, Element) throws -> Void) rethrows {
        assertUnimplemented()
    }
    
    public func forEach(_ body: (Element, Element, Element) throws -> Void) rethrows {
        assertUnimplemented()
    }
    
    public func forEach(_ body: (Element, Element, Element, Element) throws -> Void) rethrows {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == Int8 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == Int8 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == UInt8 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == UInt8 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == Int16 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == Int16 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == UInt16 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == UInt16 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == Int32 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == Int32 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == UInt32 {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == UInt32 {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == Float {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == Float {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == Double {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == Double {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == SIMD2<Float> {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == SIMD2<Float> {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == SIMD3<Float> {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == SIMD3<Float> {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshBuffer where Element == SIMD4<Float> {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == SIMD4<Float> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshBuffer where Element == MeshJointInfluence {
    public init(_ array: [Element]) {
        assertUnimplemented()
    }
    
    public init(elements: [Element], indices: [UInt32]) {
        assertUnimplemented()
    }
    
    public init<S>(_ sequence: S) where S : Sequence, S.Element == MeshJointInfluence {
        assertUnimplemented()
    }
}
