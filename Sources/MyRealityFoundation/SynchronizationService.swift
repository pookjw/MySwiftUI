@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol SynchronizationService : AnyObject {
    typealias Identifier = UInt64
    
    @preconcurrency @MainActor func entity(for identifier: Self.Identifier) -> Entity?
    @preconcurrency @MainActor func owner(of entity: Entity) -> (any SynchronizationPeerID)?
    @discardableResult
    @preconcurrency @MainActor func giveOwnership(of entity: Entity, toPeer: any SynchronizationPeerID) -> Bool
    func __fromCore(peerID: __PeerIDRef) -> (any SynchronizationPeerID)?
    func __toCore(peerID: any SynchronizationPeerID) -> __PeerIDRef
}
