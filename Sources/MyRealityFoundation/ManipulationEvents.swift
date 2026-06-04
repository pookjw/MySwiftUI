public import Spatial

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
public enum ManipulationEvents {
    public typealias InputDeviceSet = Set<ManipulationComponent.InputDevice>
    
    public struct WillBegin : Event {
        public let entity: Entity
        
        public let inputDeviceSet: ManipulationEvents.InputDeviceSet
        
        public let pivotPoint: Point3DFloat
    }
    
    public struct DidUpdateTransform : Event {
        public let entity: Entity
        
        public let inputDeviceSet: ManipulationEvents.InputDeviceSet
        
        public let pivotPoint: Point3DFloat
    }
    
    public struct WillRelease : Event {
        public let entity: Entity
        
        public let inputDeviceSet: ManipulationEvents.InputDeviceSet
        
        public let wasCancelled: Bool
    }
    
    public struct WillEnd : Event {
        public let entity: Entity
    }
    
    public struct DidHandOff : Event {
        public let entity: Entity
        
        public let oldInputDeviceSet: ManipulationEvents.InputDeviceSet
        
        public let newInputDeviceSet: ManipulationEvents.InputDeviceSet
    }
}
