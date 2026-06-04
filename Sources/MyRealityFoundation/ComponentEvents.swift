@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum ComponentEvents {
    public struct DidAdd : Event {
        public let entity: Entity
        
        public let componentType: any Component.Type
    }
    
    public struct DidActivate : Event {
        public let entity: Entity
        
        public let componentType: any Component.Type
    }
    
    public struct WillDeactivate : Event {
        public let entity: Entity
        
        public let componentType: any Component.Type
    }
    
    public struct WillRemove : Event {
        public let entity: Entity
        
        public let componentType: any Component.Type
    }
    
    public struct DidChange : Event {
        public let entity: Entity
        
        public let componentType: any Component.Type
    }
}
