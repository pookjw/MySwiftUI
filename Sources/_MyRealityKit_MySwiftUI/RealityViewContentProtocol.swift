@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
public protocol RealityViewContentProtocol {
    associatedtype Entities : EntityCollection
    var entities: Self.Entities { get nonmutating set }
    func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)?, componentType: (any Component.Type)?, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension RealityViewContentProtocol {
    public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)?, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
    
    public func subscribe<E>(to event: E.Type, componentType: (any Component.Type)? = nil, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension RealityViewContentProtocol {
    public func add(_ entity: Entity) {
        assertUnimplemented()
    }
    
    public func remove(_ entity: Entity) {
        assertUnimplemented()
    }
}
