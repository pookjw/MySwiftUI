@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct PhysicsBodyComponent : Component, Equatable {
    public var mode: PhysicsBodyMode
    
    public var massProperties: PhysicsMassProperties
    
    public var material: PhysicsMaterialResource
    
    public var isTranslationLocked: (x: Bool, y: Bool, z: Bool)
    
    public var isRotationLocked: (x: Bool, y: Bool, z: Bool)
    
    public var isContinuousCollisionDetectionEnabled: Bool
    
    public init() {
        assertUnimplemented()
    }
    
    public init(massProperties: PhysicsMassProperties = .default, material: PhysicsMaterialResource? = nil, mode: PhysicsBodyMode = .dynamic) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public init(shapes: [ShapeResource], density: Float, material: PhysicsMaterialResource? = nil, mode: PhysicsBodyMode = .dynamic) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public init(shapes: [ShapeResource], mass: Float, material: PhysicsMaterialResource? = nil, mode: PhysicsBodyMode = .dynamic) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> PhysicsBodyComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (lhs: PhysicsBodyComponent, rhs: PhysicsBodyComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension PhysicsBodyComponent {
    public var isAffectedByGravity: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var linearDamping: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var angularDamping: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
