@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class TriggerVolume : Entity, HasCollision {
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(shape: ShapeResource, filter: CollisionFilter = .sensor) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init(shapes: [ShapeResource], filter: CollisionFilter = .sensor) {
        assertUnimplemented()
    }
    }
