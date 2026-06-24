// 6C59EBF8CD01332EB851D19EA2F31D6B
internal import Combine

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
    
    func subscribe<U>(subscriber: U, to: T) where U: Combine::Cancellable, U: Combine::Subscriber, T.Failure == U.Failure, T.Output == U.Input {
        assertUnimplemented()
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
        fileprivate var combineIdentifier: Combine::CombineIdentifier
        private weak var parent: SubscriptionLifetime<T>?
        private let downstream: U
        private let subscriptionID: Int
        
        init(parent: SubscriptionLifetime<T>, downstream: U, subscriptionID: Int) {
            assertUnimplemented()
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
