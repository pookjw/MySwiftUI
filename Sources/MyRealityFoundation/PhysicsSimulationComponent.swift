public import CoreMedia

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct PhysicsSimulationComponent : Component, Equatable {
    public struct CollisionOptions : OptionSet, Sendable {
        public static let none: PhysicsSimulationComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        public static let reportKinematicVsStatic: PhysicsSimulationComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        public static let reportKinematicVsKinematic: PhysicsSimulationComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        public static let all: PhysicsSimulationComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        public let rawValue: UInt8
        
        public init(rawValue: UInt8) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias ArrayLiteralElement = PhysicsSimulationComponent.CollisionOptions
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = PhysicsSimulationComponent.CollisionOptions
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = UInt8
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    public struct SolverIterations : Equatable {
        public init(positionIterations: Int = 6, velocityIterations: Int = 1) {
            assertUnimplemented()
        }
        
        public var positionIterations: Int
        
        public var velocityIterations: Int
        
        public static func == (a: PhysicsSimulationComponent.SolverIterations, b: PhysicsSimulationComponent.SolverIterations) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    public var solverIterations: PhysicsSimulationComponent.SolverIterations
    
    public static func nearestSimulationEntity(for entity: Entity) -> Entity? {
        assertUnimplemented()
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public var gravity: SIMD3<Float>
    
    public var collisionOptions: PhysicsSimulationComponent.CollisionOptions
    
    public var clock: CMClockOrTimebase {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> PhysicsSimulationComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static func == (a: PhysicsSimulationComponent, b: PhysicsSimulationComponent) -> Bool {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}
