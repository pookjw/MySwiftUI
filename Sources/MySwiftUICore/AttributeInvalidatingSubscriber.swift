// 793D6F3A821DF9AD951A5651887F0D07
internal import AttributeGraph
internal import Combine

final class AttributeInvalidatingSubscriber<T : Combine::Publisher> : Combine::Subscriber, Combine::CustomCombineIdentifierConvertible {
    private weak var host: GraphHost? = nil
    let attribute: WeakAttribute<Void>
    private var state: AttributeInvalidatingSubscriber<T>.StateType = .unsubscribed
    
    init(host: GraphHost, attribute: WeakAttribute<Void>) {
        self.host = host
        self.attribute = attribute
    }
    
    func receive(subscription: Combine::Subscription) {
        assertUnimplemented()
    }
    
    func receive(_: T.Output) -> Combine::Subscribers.Demand {
        assertUnimplemented()
    }
    
    fileprivate func invalidateAttribute() {
        assertUnimplemented()
    }
    
    func receive(completion: Combine::Subscribers.Completion<T.Failure>) {
        assertUnimplemented()
    }
    
    func cancel() {
        assertUnimplemented()
    }
}

extension AttributeInvalidatingSubscriber {
    fileprivate enum StateType {
        case subscribed(Combine::Subscription)
        case unsubscribed
        case complete
    }
}
