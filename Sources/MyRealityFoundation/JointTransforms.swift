@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct JointTransforms : BidirectionalCollection, MutableCollection, ExpressibleByArrayLiteral, Equatable, AnimatableData {
    public typealias Index = Int
    
    public typealias Element = Transform
    
    public typealias ArrayLiteralElement = Transform
    
    public init() {
        assertUnimplemented()
    }
    
    public init(arrayLiteral elements: Transform...) {
        assertUnimplemented()
    }
    
    public init<S>(_ transforms: S) where S : Sequence, S.Element == Transform {
        assertUnimplemented()
    }
    
    public subscript(index: JointTransforms.Index) -> Transform {
        get {
            assertUnimplemented()
        }
        set(newValue) {
            assertUnimplemented()
        }
    }
    
    public var startIndex: JointTransforms.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public var endIndex: JointTransforms.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(after i: JointTransforms.Index) -> JointTransforms.Index {
        assertUnimplemented()
    }
    
    public func index(before i: JointTransforms.Index) -> JointTransforms.Index {
        assertUnimplemented()
    }
    
    public static func == (lhs: JointTransforms, rhs: JointTransforms) -> Bool {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Indices = DefaultIndices<JointTransforms>
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Iterator = IndexingIterator<JointTransforms>
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias SubSequence = Slice<JointTransforms>
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension JointTransforms : Codable {
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}
