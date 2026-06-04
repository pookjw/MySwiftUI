@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct IKComponent : Component {
    public var resource: IKResource?
    
    public var solvers: IKComponent.SolverCollection
    
    public init(resource: IKResource?) {
        assertUnimplemented()
    }
    
    @_hasMissingDesignatedInitializers public class Solver : Identifiable {
        public struct ID : Hashable, Equatable {
            public static func == (a: IKComponent.Solver.ID, b: IKComponent.Solver.ID) -> Bool {
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
        
        init(coreComp: OpaquePointer, solverIndex: Int) {
            assertUnimplemented()
        }
        
        public var id: IKComponent.Solver.ID {
            get {
                assertUnimplemented()
            }
        }
        
        public var maxIterations: Int {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var globalFkWeight: Float {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public func reset() {
            assertUnimplemented()
        }
        
        public var joints: IKComponent.JointCollection
        
        public var constraints: IKComponent.ConstraintCollection
        }
    
    @_hasMissingDesignatedInitializers public class Joint : Identifiable {
        public typealias ID = IKRig.Joint.ID
        
        @safe final public nonisolated(unsafe) let id: IKComponent.Joint.ID = {
            assertUnimplemented()
        }()
        
        public var name: String {
            get {
                assertUnimplemented()
            }
        }
        
        public var fkWeightPerAxis: SIMD3<Float> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var rotationStiffness: SIMD3<Float> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        }
    
    @_hasMissingDesignatedInitializers public class Constraint : Identifiable {
        public typealias ID = IKRig.Constraint.ID
        
        public struct DemandOptions : OptionSet {
            public let rawValue: UInt = {
                assertUnimplemented()
            }()
            
            public init(rawValue: UInt) {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias ArrayLiteralElement = IKComponent.Constraint.DemandOptions
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKComponent.Constraint.DemandOptions
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias RawValue = UInt
        }
        
        @safe final public nonisolated(unsafe) let id: IKComponent.Constraint.ID = {
            assertUnimplemented()
        }()
        
        public var name: String {
            get {
                assertUnimplemented()
            }
        }
        
        public var jointID: IKComponent.Joint.ID {
            get {
                assertUnimplemented()
            }
        }
        
        public var demands: IKComponent.Constraint.DemandOptions {
            get {
                assertUnimplemented()
            }
        }
        
        public var target: Transform {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var offset: Transform {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var lookAtTargetPosition: SIMD3<Float> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var animationOverrideWeight: (position: Float, rotation: Float) {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        }
    
    public struct SolverCollection : Collection, Sequence {
        public typealias Element = IKComponent.Solver
        
        public subscript(id: IKComponent.SolverCollection.Element.ID) -> IKComponent.SolverCollection.Element? {
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
        
        public func contains(_ id: IKComponent.SolverCollection.Element.ID) -> Bool {
            assertUnimplemented()
        }
        
        @discardableResult
        public mutating func set(_ newValue: IKComponent.SolverCollection.Element) -> IKComponent.SolverCollection.Element? {
            assertUnimplemented()
        }
        
        public typealias Index = Int
        
        public var startIndex: IKComponent.SolverCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: IKComponent.SolverCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public subscript(position: IKComponent.SolverCollection.Index) -> IKComponent.SolverCollection.Element {
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
        
        public func index(after: IKComponent.SolverCollection.Index) -> IKComponent.SolverCollection.Index {
            assertUnimplemented()
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> IKComponent.SolverCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKComponent.SolverCollection.Element
        }
        
        public __consuming func makeIterator() -> IKComponent.SolverCollection.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<IKComponent.SolverCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<IKComponent.SolverCollection>
    }
    
    public struct JointCollection : Collection, Sequence {
        public typealias Element = IKComponent.Joint
        
        public subscript(id: IKComponent.JointCollection.Element.ID) -> IKComponent.JointCollection.Element? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public subscript(name: String) -> IKComponent.JointCollection.Element? {
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
        
        public func contains(_ id: IKComponent.JointCollection.Element.ID) -> Bool {
            assertUnimplemented()
        }
        
        @discardableResult
        public mutating func set(_ newValue: IKComponent.JointCollection.Element) -> IKComponent.JointCollection.Element? {
            assertUnimplemented()
        }
        
        public typealias Index = Int
        
        public var startIndex: IKComponent.JointCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: IKComponent.JointCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public subscript(position: IKComponent.JointCollection.Index) -> IKComponent.JointCollection.Element {
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
        
        public func index(after: IKComponent.JointCollection.Index) -> IKComponent.JointCollection.Index {
            assertUnimplemented()
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> IKComponent.JointCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKComponent.JointCollection.Element
        }
        
        public __consuming func makeIterator() -> IKComponent.JointCollection.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<IKComponent.JointCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<IKComponent.JointCollection>
    }
    
    public struct ConstraintCollection : Collection, Sequence {
        public typealias Element = IKComponent.Constraint
        
        public subscript(id: IKComponent.ConstraintCollection.Element.ID) -> IKComponent.ConstraintCollection.Element? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public subscript(name: String) -> IKComponent.ConstraintCollection.Element? {
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
        
        public func contains(_ id: IKComponent.ConstraintCollection.Element.ID) -> Bool {
            assertUnimplemented()
        }
        
        @discardableResult
        public mutating func set(_ newValue: IKComponent.ConstraintCollection.Element) -> IKComponent.ConstraintCollection.Element? {
            assertUnimplemented()
        }
        
        public typealias Index = Int
        
        public var startIndex: IKComponent.ConstraintCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: IKComponent.ConstraintCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public subscript(position: IKComponent.ConstraintCollection.Index) -> IKComponent.ConstraintCollection.Element {
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
        
        public func index(after: IKComponent.ConstraintCollection.Index) -> IKComponent.ConstraintCollection.Index {
            assertUnimplemented()
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> IKComponent.ConstraintCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = IKComponent.ConstraintCollection.Element
        }
        
        public __consuming func makeIterator() -> IKComponent.ConstraintCollection.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<IKComponent.ConstraintCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<IKComponent.ConstraintCollection>
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension IKComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> IKComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
