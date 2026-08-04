public import Foundation
public import simd
private import CoreRE

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
@unsafe public struct ForceEffectParameters {
    public let entity: MyRealityFoundation::Entity // 0x0
    public let physicsBodyCount: Int // 0x8
    public let fixedDeltaTime: TimeInterval // 0x10
    public let elapsedTime: TimeInterval // 0x18
    public let positions: UnsafeForceEffectBuffer<SIMD3<Float>>? // 0x20
    public let orientations: UnsafeForceEffectBuffer<simd_quatf>? // 0x38
    public let velocities: UnsafeForceEffectBuffer<SIMD3<Float>>? // 0x50
    public let angularVelocities: UnsafeForceEffectBuffer<SIMD3<Float>>? // 0x68
    public let distances: UnsafeForceEffectBuffer<Float>? // 0x80
    public let masses: UnsafeForceEffectBuffer<Float>? // 0x98
    public let inertiaTensors: UnsafeForceEffectBuffer<simd_float3x3>? // 0xb0
    private let forceBuffer: UnsafeMutableBufferPointer<SIMD3<Float>> // 0xc8
    private let torqueBuffer: UnsafeMutableBufferPointer<SIMD3<Float>> // 0xd8
    
    public func setForce(_ force: SIMD3<Float>, index: Int) {
        assertUnimplemented()
    }
    
    public func setTorque(_ torque: SIMD3<Float>, index: Int) {
        assertUnimplemented()
    }
    
    static func __fromCore(_ core: UnsafeRawPointer) -> ForceEffectParameters {
        let parameters = unsafe core
            .assumingMemoryBound(to: CoreRE::ForceEffectParameters.self)
            .pointee
        
        let entity = MyRealityFoundation::Entity.__fromCore(
            __EntityRef(
                core: unsafeBitCast(parameters.entity!, to: OpaquePointer.self)
            )
        )
        
        let positions: UnsafeForceEffectBuffer<SIMD3<Float>>?
        if let _positions = unsafe parameters.positions {
            unsafe positions = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _positions,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe positions = nil
        }
        
        let orientations: UnsafeForceEffectBuffer<simd_quatf>?
        if let _orientations = unsafe parameters.orientations {
            unsafe orientations = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _orientations,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe orientations = nil
        }
        
        let velocities: UnsafeForceEffectBuffer<SIMD3<Float>>?
        if let _velocities = unsafe parameters.velocities {
            unsafe velocities = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _velocities,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe velocities = nil
        }
        
        let angularVelocities: UnsafeForceEffectBuffer<SIMD3<Float>>?
        if let _angularVelocities = unsafe parameters.angularVelocities {
            unsafe angularVelocities = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _angularVelocities,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe angularVelocities = nil
        }
        
        let distances: UnsafeForceEffectBuffer<Float>?
        if let _distances = unsafe parameters.distances {
            unsafe distances = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _distances,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe distances = nil
        }
        
        let masses: UnsafeForceEffectBuffer<Float>?
        if let _masses = unsafe parameters.masses {
            unsafe masses = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _masses,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe masses = nil
        }
        
        let inertiaTensors: UnsafeForceEffectBuffer<simd_float3x3>?
        if let _inertiaTensors = unsafe parameters.inertiaTensors {
            unsafe inertiaTensors = UnsafeForceEffectBuffer(
                storage: UnsafeBufferPointer(
                    start: _inertiaTensors,
                    count: parameters.physicsBodyCount
                )
            )
        } else {
            unsafe inertiaTensors = nil
        }
        
        let forceBuffer: UnsafeMutableBufferPointer<SIMD3<Float>>
        unsafe forceBuffer = UnsafeMutableBufferPointer(
            mutating: UnsafeBufferPointer(
                start: parameters.forceBuffer,
                count: parameters.physicsBodyCount
            )
        )
        
        let torqueBuffer: UnsafeMutableBufferPointer<SIMD3<Float>>
        unsafe torqueBuffer = UnsafeMutableBufferPointer(
            mutating: UnsafeBufferPointer(
                start: parameters.torqueBuffer,
                count: parameters.physicsBodyCount
            )
        )
        
        return unsafe ForceEffectParameters(
            entity: entity,
            physicsBodyCount: parameters.physicsBodyCount,
            fixedDeltaTime: TimeInterval(parameters.fixedDeltaTime),
            elapsedTime: TimeInterval(parameters.elapsedTime),
            positions: positions,
            orientations: orientations,
            velocities: velocities,
            angularVelocities: angularVelocities,
            distances: distances,
            masses: masses,
            inertiaTensors: inertiaTensors,
            forceBuffer: forceBuffer,
            torqueBuffer: torqueBuffer
        )
    }
}
