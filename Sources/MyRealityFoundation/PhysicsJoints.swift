@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsJoints : BidirectionalCollection, MutableCollection, RangeReplaceableCollection, Equatable, ExpressibleByArrayLiteral {
    public init() {
        assertUnimplemented()
    }
    
    public init(arrayLiteral: any PhysicsJoint...) {
        assertUnimplemented()
    }
    
    public init(_ sequence: any Sequence<any PhysicsJoint>) {
        assertUnimplemented()
    }
    
    public let startIndex: Int
    
    public var endIndex: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public typealias Element = PhysicsJoint
    
    public typealias Index = Int
    
    public func index(before i: Int) -> Int {
        assertUnimplemented()
    }
    
    public func index(after i: Int) -> Int {
        assertUnimplemented()
    }
    
    public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public subscript(index: Int) -> any PhysicsJoint {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public mutating func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where C : Collection, C.Element == any PhysicsJoint {
        assertUnimplemented()
    }
    
    public static func == (lhs: PhysicsJoints, rhs: PhysicsJoints) -> Bool {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ArrayLiteralElement = any PhysicsJoint
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<PhysicsJoints>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Iterator = IndexingIterator<PhysicsJoints>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<PhysicsJoints>
}
