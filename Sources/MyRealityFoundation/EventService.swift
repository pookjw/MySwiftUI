internal import Combine

protocol EventService {
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?, componentType: (any Component.Type)?) -> MyRealityFoundation::Scene.CorePublisher<T>
    func subscriber<T : Sendable>(for type: T.Type, on eventSource: EventSource?, componentType: (any Component.Type)?) -> __REEventSubscriber<T>
    func publisher<T : Sendable>(for type: T.Type, on eventSource: EventSource?, matching: String?) -> MyRealityFoundation::Scene.CorePublisher<T>
    func subscriber<T : Sendable>(for type: T.Type, on eventSource: EventSource?) -> __REEventSubscriber<T>
}
