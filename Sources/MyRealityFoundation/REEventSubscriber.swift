public import Combine

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __REEventSubscriber<CoreEvent> : Subscriber where CoreEvent : Sendable {
    public typealias Input = CoreEvent
    
    public typealias Failure = Never
    
    public var combineIdentifier: CombineIdentifier {
        get {
            assertUnimplemented()
        }
    }
    
    public func receive(subscription: any Subscription) {
        assertUnimplemented()
    }
    
    public func receive(_ input: __REEventSubscriber<CoreEvent>.Input) -> Subscribers.Demand {
        assertUnimplemented()
    }
    
    public func receive(completion: Subscribers.Completion<Never>) {
        assertUnimplemented()
    }
}
