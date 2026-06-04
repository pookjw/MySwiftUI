public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public enum PhysicsSimulationEvents {
    public struct WillSimulate : Event {
        public let deltaTime: TimeInterval
        
        @available(visionOS, introduced: 1.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(macOS, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(macCatalyst, introduced: 18.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(iOS, introduced: 18.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(tvOS, unavailable)
        public let simulationEntity: Entity
        
        @available(macCatalyst 26.0, visionOS 26.0, iOS 26.0, macOS 26.0, tvOS 26.0, *)
        public let simulationRootEntity: Entity?
    }
    
    public struct DidSimulate : Event {
        public let deltaTime: TimeInterval
        
        @available(visionOS, introduced: 1.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(macOS, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(macCatalyst, introduced: 18.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(iOS, introduced: 18.0, deprecated: 26.0, renamed: "simulationRootEntity")
        @available(tvOS, unavailable)
        public let simulationEntity: Entity
        
        @available(macCatalyst 26.0, visionOS 26.0, iOS 26.0, macOS 26.0, tvOS 26.0, *)
        public let simulationRootEntity: Entity?
    }
}
