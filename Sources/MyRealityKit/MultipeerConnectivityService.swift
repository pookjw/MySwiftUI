public import MultipeerConnectivity

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
public class MultipeerConnectivityService : SynchronizationService {
    @safe final public nonisolated(unsafe) let session: MCSession = {
        assertUnimplemented()
    }()
    
    public init(session: MCSession) throws {
        assertUnimplemented()
    }
    
    public func setHandshake(count: UInt32, timeoutMs: UInt32) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func entity(for identifier: MultipeerConnectivityService.Identifier) -> Entity? {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func owner(of entity: Entity) -> (any SynchronizationPeerID)? {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func giveOwnership(of entity: Entity, toPeer peer: any SynchronizationPeerID) -> Bool {
        assertUnimplemented()
    }
    
    public func __fromCore(peerID: __PeerIDRef) -> (any SynchronizationPeerID)? {
        assertUnimplemented()
    }
    
    public func __toCore(peerID: any SynchronizationPeerID) -> __PeerIDRef {
        assertUnimplemented()
    }
    
    public func startSync() {
        assertUnimplemented()
    }
    
    public func stopSync() {
        assertUnimplemented()
    }
    }
