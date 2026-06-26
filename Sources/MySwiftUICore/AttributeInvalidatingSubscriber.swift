// 793D6F3A821DF9AD951A5651887F0D07
internal import AttributeGraph
internal import Combine
private import _DarwinFoundation3.pthread
private import os.log
private import _MySwiftUIShims

final class AttributeInvalidatingSubscriber<T : Combine::Publisher> : Combine::Subscriber, Combine::Cancellable, Combine::CustomCombineIdentifierConvertible {
    private weak var host: GraphHost? = nil
    let attribute: WeakAttribute<Void>
    private var state: AttributeInvalidatingSubscriber<T>.StateType = .unsubscribed
    
    init(host: GraphHost, attribute: WeakAttribute<Void>) {
        self.host = host
        self.attribute = attribute
    }
    
    func receive(subscription: Combine::Subscription) {
        switch self.state {
        case .subscribed(_):
            subscription.cancel()
        case .unsubscribed, .complete:
            self.state = .subscribed(subscription)
            subscription.request(.unlimited)
        }
    }
    
    func receive(_ output: T.Output) -> Combine::Subscribers.Demand {
        if case .subscribed(_) = self.state {
            self.invalidateAttribute()
        }
        
        return .none
    }
    
    fileprivate func invalidateAttribute() {
        if pthread_main_np() == 0 {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.")
        } else if Update.isOwner && isLinkedOnOrAfter(.v4) {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Publishing changes from within view updates is not allowed, this will cause undefined behavior.")
        }
        
        // <+256>
        // x21
        let host = self.host
        
        Update.ensure {
            guard let host else {
                return
            }
            
            host.asyncTransaction(
                Transaction.current,
                id: Transaction.ID(value: _threadTransactionID(false)),
                mutation: InvalidatingGraphMutation(attribute: self.attribute.base),
                style: .immediate,
                mayDeferUpdate: true
            )
        }
    }
    
    func receive(completion: Combine::Subscribers.Completion<T.Failure>) {
        assertUnimplemented()
    }
    
    func cancel() {
        if case .subscribed(let subscription) = self.state {
            subscription.cancel()
        }
        
        self.state = .unsubscribed
    }
}

extension AttributeInvalidatingSubscriber {
    fileprivate enum StateType {
        case subscribed(Combine::Subscription)
        case unsubscribed
        case complete
    }
}
