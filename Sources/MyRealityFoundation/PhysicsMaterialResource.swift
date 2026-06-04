@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class PhysicsMaterialResource : Resource {
    @MainActor @preconcurrency public static let `default`: PhysicsMaterialResource = {
        assertUnimplemented()
    }()
    
    @MainActor @preconcurrency public var __staticFriction: Float {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __dynamicFriction: Float {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __restitution: Float {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func generate(friction: Float = 0.8, restitution: Float = 0.8) -> PhysicsMaterialResource {
        assertUnimplemented()
    }
    
    @available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
    @MainActor @preconcurrency public static func generate(staticFriction: Float, dynamicFriction: Float, restitution: Float) -> PhysicsMaterialResource {
        assertUnimplemented()
    }
}
