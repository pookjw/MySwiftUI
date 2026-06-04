@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct SkeletalPoseSet {
    public typealias Element = SkeletalPose
    
    public init() {
        assertUnimplemented()
    }
    
    public var `default`: SkeletalPoseSet.Element? {
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
    
    public subscript(poseID: SkeletalPose.ID) -> SkeletalPoseSet.Element? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func contains(_ poseID: SkeletalPose.ID) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public mutating func set(_ newValue: SkeletalPoseSet.Element) -> SkeletalPoseSet.Element? {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension SkeletalPoseSet : Sequence {
    public struct Iterator : IteratorProtocol {
        public mutating func next() -> SkeletalPoseSet.Element? {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = SkeletalPoseSet.Element
    }
    
    public func makeIterator() -> SkeletalPoseSet.Iterator {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension SkeletalPoseSet : Collection {
    public typealias Index = Int
    
    public var startIndex: SkeletalPoseSet.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public var endIndex: SkeletalPoseSet.Index {
        get {
            assertUnimplemented()
        }
    }
    
    public func index(of poseID: SkeletalPose.ID) -> SkeletalPoseSet.Index? {
        assertUnimplemented()
    }
    
    public subscript(index: SkeletalPoseSet.Index) -> SkeletalPoseSet.Element {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func index(after: SkeletalPoseSet.Index) -> SkeletalPoseSet.Index {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Indices = DefaultIndices<SkeletalPoseSet>
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias SubSequence = Slice<SkeletalPoseSet>
}
