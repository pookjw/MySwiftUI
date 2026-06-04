@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct BlendShapeWeights : BidirectionalCollection, MutableCollection, ExpressibleByArrayLiteral, Equatable, AnimatableData {
    public typealias Index = Int
    
    public typealias Element = Float
    
    public typealias ArrayLiteralElement = Float
    
    public init() {
        assertUnimplemented()
    }
    
    public init(arrayLiteral elements: Float...) {
        assertUnimplemented()
    }
    
    public init<S>(_ weights: S) where S : Sequence, S.Element == Float {
        assertUnimplemented()
    }
    
    public subscript(index: BlendShapeWeights.Index) -> Float {
        get {
            assertUnimplemented()
        }
        set(newValue) {
            assertUnimplemented()
        }
    }
    
    public var startIndex: BlendShapeWeights.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public var endIndex: BlendShapeWeights.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(after i: BlendShapeWeights.Index) -> BlendShapeWeights.Index {
        assertUnimplemented()
    }
    
    public func index(before i: BlendShapeWeights.Index) -> BlendShapeWeights.Index {
        assertUnimplemented()
    }
    
    public static func == (lhs: BlendShapeWeights, rhs: BlendShapeWeights) -> Bool {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<BlendShapeWeights>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Iterator = IndexingIterator<BlendShapeWeights>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<BlendShapeWeights>
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension BlendShapeWeights : Codable {
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
