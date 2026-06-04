@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct IKRig {
    public var maxIterations: Int
    
    public var globalFkWeight: Float
    
    public var globalLimitsWeight: Float
    
    public var joints: IKRig.JointCollection
    
    public var constraints: IKRig.ConstraintsCollection
    
    public init(for skeleton: MeshResource.Skeleton) throws {
        assertUnimplemented()
    }
    
    public struct Joint : Identifiable {
        public struct ID : Hashable, Equatable {
            public static func == (a: IKRig.Joint.ID, b: IKRig.Joint.ID) -> Bool {
                assertUnimplemented()
            }
            
            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }
            
            public var hashValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public init(name: String, parentID: IKRig.Joint.ID? = nil, restTransform: Transform = .identity) {
            assertUnimplemented()
        }
        
        public var id: IKRig.Joint.ID {
            get {
                assertUnimplemented()
            }
        }
        
        public let name: String
        
        public var parentID: IKRig.Joint.ID?
        
        public var restTransform: Transform
        
        public var active: Bool
        
        public var fkWeightPerAxis: SIMD3<Float>
        
        public var rotationStiffness: SIMD3<Float>
        
        public var limits: IKRig.Joint.LimitsDefinition?
        
        public struct LimitsDefinition {
            public enum Axis {
                case x
                case y
                case z
                
                public static func == (a: IKRig.Joint.LimitsDefinition.Axis, b: IKRig.Joint.LimitsDefinition.Axis) -> Bool {
                    assertUnimplemented()
                }
                
                public func hash(into hasher: inout Hasher) {
                    assertUnimplemented()
                }
                
                public var hashValue: Int {
                    get {
                        assertUnimplemented()
                    }
                }
            }
            
            public var weight: Float
            
            public var boneAxis: IKRig.Joint.LimitsDefinition.Axis
            
            public var minimumAngles: SIMD3<Float>
            
            public var maximumAngles: SIMD3<Float>
            
            public init(weight: Float = 1.0, boneAxis: IKRig.Joint.LimitsDefinition.Axis = .x, minimumAngles: SIMD3<Float> = [-2.0 * .pi, -2.0 * .pi, -2.0 * .pi], maximumAngles: SIMD3<Float> = [2.0 * .pi, 2.0 * .pi, 2.0 * .pi]) {
                assertUnimplemented()
            }
        }
    }
    
    public struct Constraint : Identifiable {
        public struct ID : Hashable, Equatable {
            public static func == (a: IKRig.Constraint.ID, b: IKRig.Constraint.ID) -> Bool {
                assertUnimplemented()
            }
            
            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }
            
            public var hashValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public var id: IKRig.Constraint.ID {
            get {
                assertUnimplemented()
            }
        }
        
        public var name: String
        
        public var jointName: String
        
        public var offset: Transform
        
        public var positionDemand: IKRig.Constraint.IKPositionDemand?
        
        public var orientationDemand: IKRig.Constraint.IKOrientationDemand?
        
        public struct IKPositionDemand {
            public init() {
                assertUnimplemented()
            }
            
            public enum Mode {
                case reach
                case poleVector
                
                public static func == (a: IKRig.Constraint.IKPositionDemand.Mode, b: IKRig.Constraint.IKPositionDemand.Mode) -> Bool {
                    assertUnimplemented()
                }
                
                public func hash(into hasher: inout Hasher) {
                    assertUnimplemented()
                }
                
                public var hashValue: Int {
                    get {
                        assertUnimplemented()
                    }
                }
            }
            
            public var mode: IKRig.Constraint.IKPositionDemand.Mode
            
            public var influenceDepthMaxJointCount: Int
            
            public var weight: SIMD3<Float>
        }
        
        public struct IKOrientationDemand {
            public init() {
                assertUnimplemented()
            }
            
            public enum Mode {
                case orientation
                case additiveLookAt(targetAxis: SIMD3<Float>)
                case absoluteLookAt(targetAxis: SIMD3<Float>)
            }
            
            public var mode: IKRig.Constraint.IKOrientationDemand.Mode
            
            public var influenceDepthMaxJointCount: Int
            
            public var weight: SIMD3<Float>
        }
        
        public static func point(named name: String, on jointName: String, positionWeight: SIMD3<Float> = [1, 1, 1]) -> IKRig.Constraint {
            assertUnimplemented()
        }
        
        public static func orient(named name: String, on jointName: String, orientationWeight: SIMD3<Float> = [1, 1, 1]) -> IKRig.Constraint {
            assertUnimplemented()
        }
        
        public static func parent(named name: String, on jointName: String, positionWeight: SIMD3<Float> = [1, 1, 1], orientationWeight: SIMD3<Float> = [1, 1, 1]) -> IKRig.Constraint {
            assertUnimplemented()
        }
        
        public static func lookAtAdditive(named name: String, on jointName: String, lookingAlong targetAxis: SIMD3<Float>, orientationWeight: SIMD3<Float> = [1, 1, 1]) -> IKRig.Constraint {
            assertUnimplemented()
        }
        
        public static func lookAtAbsolute(named name: String, on jointName: String, lookingAlong targetAxis: SIMD3<Float>, orientationWeight: SIMD3<Float> = [1, 1, 1]) -> IKRig.Constraint {
            assertUnimplemented()
        }
    }
    
    public struct JointCollection : Collection, Sequence {
        public typealias Element = IKRig.Joint
        
        public subscript(id: IKRig.JointCollection.Element.ID) -> IKRig.JointCollection.Element? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public subscript(name: String) -> IKRig.JointCollection.Element? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public mutating func forEach(descendantOf rootJointName: String, inclusive: Bool = false, update: (inout IKRig.JointCollection.Element) -> Void) {
            assertUnimplemented()
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
        
        public func contains(_ id: IKRig.JointCollection.Element.ID) -> Bool {
            assertUnimplemented()
        }
        
        @discardableResult
        public mutating func set(_ newValue: IKRig.JointCollection.Element) -> IKRig.JointCollection.Element? {
            assertUnimplemented()
        }
        
        public typealias Index = Int
        
        public var startIndex: IKRig.JointCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: IKRig.JointCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public subscript(position: IKRig.JointCollection.Index) -> IKRig.JointCollection.Element {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }
        
        public func index(after: IKRig.JointCollection.Index) -> IKRig.JointCollection.Index {
            assertUnimplemented()
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> IKRig.JointCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKRig.JointCollection.Element
        }
        
        public __consuming func makeIterator() -> IKRig.JointCollection.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<IKRig.JointCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<IKRig.JointCollection>
    }
    
    public struct ConstraintsCollection : Collection, Sequence, ExpressibleByArrayLiteral {
        public typealias Element = IKRig.Constraint
        
        public init(_ elements: [IKRig.ConstraintsCollection.Element]) {
            assertUnimplemented()
        }
        
        public subscript(name: String) -> IKRig.ConstraintsCollection.Element? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public subscript(id: IKRig.ConstraintsCollection.Element.ID) -> IKRig.ConstraintsCollection.Element? {
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
        
        public func contains(_ id: IKRig.ConstraintsCollection.Element.ID) -> Bool {
            assertUnimplemented()
        }
        
        @discardableResult
        public mutating func set(_ newValue: IKRig.ConstraintsCollection.Element) -> IKRig.ConstraintsCollection.Element? {
            assertUnimplemented()
        }
        
        public typealias Index = Int
        
        public var startIndex: IKRig.ConstraintsCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: IKRig.ConstraintsCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public subscript(position: IKRig.ConstraintsCollection.Index) -> IKRig.ConstraintsCollection.Element {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }
        
        public func index(after: IKRig.ConstraintsCollection.Index) -> IKRig.ConstraintsCollection.Index {
            assertUnimplemented()
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> IKRig.ConstraintsCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKRig.ConstraintsCollection.Element
        }
        
        public __consuming func makeIterator() -> IKRig.ConstraintsCollection.Iterator {
            assertUnimplemented()
        }
        
        public typealias ArrayLiteralElement = IKRig.ConstraintsCollection.Element
        
        public init(arrayLiteral elements: IKRig.ConstraintsCollection.Element...) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<IKRig.ConstraintsCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<IKRig.ConstraintsCollection>
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension IKRig.Joint.LimitsDefinition.Axis : Equatable {}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension IKRig.Joint.LimitsDefinition.Axis : Hashable {}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension IKRig.Constraint.IKPositionDemand.Mode : Equatable {}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension IKRig.Constraint.IKPositionDemand.Mode : Hashable {}
