@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum CollisionEvents {
    public struct Began : Event {
        public let entityA: Entity
        
        public let entityB: Entity
        
        public let position: SIMD3<Float>
        
        public let impulse: Float
    }
    
    public struct Updated : Event {
        public let entityA: Entity
        
        public let entityB: Entity
        
        public let position: SIMD3<Float>
        
        public let impulse: Float
    }
    
    public struct Ended : Event {
        public let entityA: Entity
        
        public let entityB: Entity
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionEvents.Began {
    public var penetrationDistance: Float {
        get {
            assertUnimplemented()
        }
    }
    
    public var impulseDirection: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var contacts: [Contact] {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionEvents.Updated {
    public var penetrationDistance: Float {
        get {
            assertUnimplemented()
        }
    }
    
    public var impulseDirection: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var contacts: [Contact] {
        get {
            assertUnimplemented()
        }
    }
}
