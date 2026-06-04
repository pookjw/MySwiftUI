@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum SynchronizationEvents {
    public struct OwnershipRequest : Event {
        public let entity: Entity
        
        @safe public nonisolated(unsafe) let requester: any SynchronizationPeerID
        @safe public nonisolated(unsafe) let accept: () -> Void
    }
    
    public struct OwnershipChanged : Event {
        public let entity: Entity
        
        @safe public nonisolated(unsafe) let newOwner: (any SynchronizationPeerID)?
    }
}
