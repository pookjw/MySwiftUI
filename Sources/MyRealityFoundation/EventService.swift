internal import Combine

protocol EventService {
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?, componentType: (any Component.Type)?) -> MyRealityFoundation::Scene.CorePublisher<T>
    func subscriber<T : Sendable>(for type: T.Type, on eventSource: EventSource?, componentType: (any Component.Type)?) -> __REEventSubscriber<T>
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?, matching: String?) -> MyRealityFoundation::Scene.CorePublisher<T>
    func subscriber<T : Sendable>(for type: T.Type, on eventSource: EventSource?) -> __REEventSubscriber<T>
}

extension EventService {
    func publish<T : PublishingEvent>(_: T, on: EventSource?, componentType: (any MyRealityFoundation::Component.Type)?) {
        assertUnimplemented()
    }
    
    func publish<T : Sendable>(_: T, on: EventSource?, componentType: (any MyRealityFoundation::Component.Type?)) {
        assertUnimplemented()
    }
    
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?) -> MyRealityFoundation::Scene.CorePublisher<T> {
        assertUnimplemented()
    }
    
    func subscriber<T : Sendable>(for type: T.Type, on: EventSource?) -> __REEventSubscriber<T> {
        assertUnimplemented()
    }
    
    func subscribe<T>(to type: T.Type, on eventSource: EventSource?, componentType: any MyRealityFoundation::Component.Type?, _: (T) -> ()) -> any Cancellable {
        assertUnimplemented()
    }
    
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?, matching: String?) -> MyRealityFoundation::Scene.CorePublisher<T> {
        assertUnimplemented()
    }
    
    func subscribe<T : Sendable>(to type: T.Type, on eventSource: EventSource?, componentType: any MyRealityFoundation::Component.Type?, _: (T) -> ()) -> any Cancellable {
        assertUnimplemented()
    }
}
