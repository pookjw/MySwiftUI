@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct BlendShapeWeightsSet {
    public typealias Element = BlendShapeWeightsData
    
    public init() {
        assertUnimplemented()
    }
    
    public var `default`: BlendShapeWeightsSet.Element? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public subscript(blendShapeName: String) -> BlendShapeWeightsSet.Element? {
        get {
            assertUnimplemented()
        }
    }
    
    public func contains(_ blendShapeName: String) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func set(_ newValue: BlendShapeWeightsSet.Element) -> BlendShapeWeightsSet.Element? {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension BlendShapeWeightsSet : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> BlendShapeWeightsSet.Element? {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = BlendShapeWeightsSet.Element
    }
    
    public func makeIterator() -> BlendShapeWeightsSet.Iterator {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension BlendShapeWeightsSet : Collection {
    public typealias Index = Int
    
    public var startIndex: BlendShapeWeightsSet.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public var endIndex: BlendShapeWeightsSet.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(of blendShapeName: String) -> BlendShapeWeightsSet.Index? {
        assertUnimplemented()
    }
    
    public subscript(index: BlendShapeWeightsSet.Index) -> BlendShapeWeightsSet.Element {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func index(after i: BlendShapeWeightsSet.Index) -> BlendShapeWeightsSet.Index {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<BlendShapeWeightsSet>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<BlendShapeWeightsSet>
}
