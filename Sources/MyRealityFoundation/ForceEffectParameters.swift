public import Foundation
public import simd

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ForceEffectParameters {
    public let entity: Entity
    
    public let physicsBodyCount: Int
    
    public let fixedDeltaTime: TimeInterval
    
    public let elapsedTime: TimeInterval
    
    public let positions: UnsafeForceEffectBuffer<SIMD3<Float>>?
    
    public let orientations: UnsafeForceEffectBuffer<simd_quatf>?
    
    public let velocities: UnsafeForceEffectBuffer<SIMD3<Float>>?
    
    public let angularVelocities: UnsafeForceEffectBuffer<SIMD3<Float>>?
    
    public let distances: UnsafeForceEffectBuffer<Float>?
    
    public let masses: UnsafeForceEffectBuffer<Float>?
    
    public let inertiaTensors: UnsafeForceEffectBuffer<simd_float3x3>?
    
    public func setForce(_ force: SIMD3<Float>, index: Int) {
        assertUnimplemented()
    }
    
    public func setTorque(_ torque: SIMD3<Float>, index: Int) {
        assertUnimplemented()
    }
}
