@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasPhysicsBody {
    @MainActor @preconcurrency public func addForce(_ force: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func addForce(_ force: SIMD3<Float>, at position: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func addTorque(_ torque: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func clearForcesAndTorques() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func applyLinearImpulse(_ impulse: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func applyAngularImpulse(_ impulse: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func applyImpulse(_ impulse: SIMD3<Float>, at position: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasPhysicsBody : HasCollision {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasPhysicsBody {
    @MainActor @preconcurrency public var physicsBody: PhysicsBodyComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasPhysicsBody {
    @available(macOS, deprecated, introduced: 10.15, renamed: "resetPhysicsTransform(recursive:)")
    @available(iOS, deprecated, introduced: 13.0, renamed: "resetPhysicsTransform(recursive:)")
    @available(macCatalyst, deprecated, introduced: 13.0, renamed: "resetPhysicsTransform(recursive:)")
    @available(visionOS, deprecated, introduced: 1.0, renamed: "resetPhysicsTransform(recursive:)")
    @available(tvOS, unavailable, introduced: 26.0, renamed: "resetPhysicsTransform(recursive:)")
    @MainActor @preconcurrency public func resetPhysicsTransform(_ transform: Transform, recursive: Bool = true) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func resetPhysicsTransform(recursive: Bool = true) {
        assertUnimplemented()
    }
}
