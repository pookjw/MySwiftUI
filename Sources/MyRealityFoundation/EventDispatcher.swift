// 9E3AD6BA34D478C65D106D94F4542597
private import os.lock
private import Combine
private import CoreRE

final class REEventDispatcher<T> {
    private unowned let eventBus: REEventBus
    private let coreHandle: OpaquePointer
    private let sourceObject: OpaquePointer?
    private let componentType: OpaquePointer?
    private let matching: String?
    private let lock: OSAllocatedUnfairLock<Void>
    private var subscribers: OrderedCoatCheckBag<AnySubscriber<T, Never>>
    
    init() {
        assertUnimplemented()
    }
    
    // TODO
}

extension REEventDispatcher {
    fileprivate final class EventSubscription<U> {
        private weak var eventBus: REEventBus?
        private var coreHandle: OpaquePointer
        private var coreSubscription: CoreRE::SubscriptionHandle?
        private var downstream: U?
        private var cancellationHandler: (() -> (Void))?
        private var pendingDemand: Subscribers.Demand
        
        init() {
            assertUnimplemented()
        }
        
        // TODO
    }
}
