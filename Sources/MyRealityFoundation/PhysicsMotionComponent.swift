@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct PhysicsMotionComponent : Component, Equatable {
    public var linearVelocity: SIMD3<Float>
    
    public var angularVelocity: SIMD3<Float>
    
    public init() {
        assertUnimplemented()
    }
    
    public init(linearVelocity: SIMD3<Float> = .zero, angularVelocity: SIMD3<Float> = .zero) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> PhysicsMotionComponent {
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
    
    public static func == (a: PhysicsMotionComponent, b: PhysicsMotionComponent) -> Bool {
        assertUnimplemented()
    }
}
