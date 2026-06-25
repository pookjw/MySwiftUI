// 6C59EBF8CD01332EB851D19EA2F31D6B
internal import Combine
private import AttributeGraph

final class SubscriptionLifetime<T : Combine::Publisher> {
    private var subscriptionID = UniqueSeedGenerator()
    private var state: SubscriptionLifetime<T>.StateType = .uninitialized
    
    init() {
    }
    
    deinit {
        self.cancel()
    }
    
    var isUninitialized: Bool {
        switch self.state {
        case .uninitialized:
            return true
        default:
            return false
        }
    }
    
    func subscribe<U>(subscriber: U, to publisher: T) where U: Combine::Cancellable, U: Combine::Subscriber, T.Failure == U.Failure, T.Output == U.Input {
        /*
         self -> x20 -> x23
         subscriber -> x0 -> x29 - 0xf8
         publisher -> x1 -> x29 - 0xd0
         */
        // <+356>
        if case .subscribed(let p, let c, let s, _) = self.state {
            // <+444>
            if compareValues(p, publisher, options: [.unknown0, .unknown1]) {
                return
            } else {
                // <+872>
                c.cancel()
                s.cancel()
            }
        }
        
        // <+972>
        let subscriptionID = self.subscriptionID.generate()
        // x29 - 0xd8
        let connection = SubscriptionLifetime.Connection(
            parent: self,
            downstream: subscriber,
            subscriptionID: subscriptionID
        )
        
        // <+1064>
        let cancellable = AnyCancellable(subscriber)
        self.state = .requestedSubscription(
            to: publisher,
            subscriber: cancellable,
            subscriptionID: subscriptionID
        )
        
        publisher.subscribe(connection)
    }
    
    func cancel() {
        assertUnimplemented()
    }
    
    fileprivate func shouldAcceptSubscription(_: any Combine::Subscription, for: Int) -> Bool {
        assertUnimplemented()
    }
    
    fileprivate func shouldAcceptValue(for: Int) -> Bool {
        assertUnimplemented()
    }
    
    fileprivate func shouldAcceptCompletion(for: Int) -> Bool {
        assertUnimplemented()
    }
}

extension SubscriptionLifetime {
    fileprivate struct Connection<U> : Combine::CustomCombineIdentifierConvertible, Combine::Subscriber {
        fileprivate var combineIdentifier = Combine::CombineIdentifier()
        private weak var parent: SubscriptionLifetime<T>? = nil
        private let downstream: U
        private let subscriptionID: Int
        
        init(parent: SubscriptionLifetime<T>, downstream: U, subscriptionID: Int) {
            self.parent = parent
            self.downstream = downstream
            self.subscriptionID = subscriptionID
        }
        
        func receive(subscription: any Combine::Subscription) {
            assertUnimplemented()
        }
        
        func receive(_ output: T.Output) -> Combine::Subscribers.Demand {
            assertUnimplemented()
        }
        
        func receive(completion: Combine::Subscribers.Completion<T.Failure>) {
            assertUnimplemented()
        }
    }
    
    enum StateType {
        case requestedSubscription(to: T, subscriber: Combine::AnyCancellable, subscriptionID: Int)
        case subscribed(to: T, subscriber: Combine::AnyCancellable, subscription: Combine::Subscription, AnyID: Int)
        case uninitialized
    }
}
