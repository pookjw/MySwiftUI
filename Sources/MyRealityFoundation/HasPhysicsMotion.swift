@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasPhysicsMotion : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasPhysicsMotion {
    @MainActor @preconcurrency public var physicsMotion: PhysicsMotionComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
