public import Foundation
public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasTransform : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasTransform {
    @MainActor @preconcurrency public var transform: Transform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var scale: SIMD3<Float> {
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
    
    @MainActor @preconcurrency public func scale(relativeTo referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setScale(_ scale: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var position: SIMD3<Float> {
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
    
    @MainActor @preconcurrency public func position(relativeTo referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setPosition(_ position: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var orientation: simd_quatf {
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
    
    @MainActor @preconcurrency public func orientation(relativeTo referenceEntity: Entity?) -> simd_quatf {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setOrientation(_ orientation: simd_quatf, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func transformMatrix(relativeTo referenceEntity: Entity?) -> float4x4 {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func setTransformMatrix(_ transform: float4x4, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(position: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(direction: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(normal: SIMD3<Float>, from referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(transform: Transform, from referenceEntity: Entity?) -> Transform {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(position: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(direction: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(normal: SIMD3<Float>, to referenceEntity: Entity?) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func convert(transform: Transform, to referenceEntity: Entity?) -> Transform {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func look(at target: SIMD3<Float>, from position: SIMD3<Float>, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public func look(at target: SIMD3<Float>, from position: SIMD3<Float>, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), relativeTo referenceEntity: Entity?, forward: Entity.ForwardDirection = .negativeZ) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func move(to transform: Transform, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func move(to transform: float4x4, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor @preconcurrency public func move(to target: Transform, relativeTo referenceEntity: Entity?, duration: TimeInterval, timingFunction: AnimationTimingFunction = .default) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor @preconcurrency public func move(to target: float4x4, relativeTo referenceEntity: Entity?, duration: TimeInterval, timingFunction: AnimationTimingFunction = .default) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func visualBounds(recursive: Bool = true, relativeTo referenceEntity: Entity?, excludeInactive: Bool = false) -> BoundingBox {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension HasTransform {
    @discardableResult
    @MainActor @preconcurrency public func align(_ originPin: GeometricPin, to targetPin: GeometricPin) -> float4x4? {
        assertUnimplemented()
    }
}
