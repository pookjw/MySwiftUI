public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct PhysicsMassProperties : Equatable {
    @safe public static nonisolated(unsafe) let `default`: PhysicsMassProperties = {
        assertUnimplemented()
    }()
    
    public var mass: Float
    
    public var inertia: SIMD3<Float>
    
    public var centerOfMass: (position: SIMD3<Float>, orientation: simd_quatf)
    
    public init() {
        assertUnimplemented()
    }
    
    public init(mass: Float, inertia: SIMD3<Float> = SIMD3<Float>(x: 0.1, y: 0.1, z: 0.1), centerOfMass: (position: SIMD3<Float>, orientation: simd_quatf) = (SIMD3<Float>(x: 0, y: 0, z: 0), simd_quatf(ix: 0, iy: 0, iz: 0, r: 1))) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public init(shape: ShapeResource, density: Float) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public init(shape: ShapeResource, mass: Float) {
        assertUnimplemented()
    }
    
    public static func == (lhs: PhysicsMassProperties, rhs: PhysicsMassProperties) -> Bool {
        assertUnimplemented()
    }
}
