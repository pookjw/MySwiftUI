// 9E3AD6BA34D478C65D106D94F4542597
private import os.lock
internal import Combine
private import CoreRE

@safe final class REEventDispatcher<T> : Combine::Subscriber, Combine::Publisher, Combine::CustomCombineIdentifierConvertible {
    typealias Input = T
    typealias Failure = Never
    typealias Output = Void
    
    private unowned let eventBus: REEventBus // 0x10
    private let coreHandle: OpaquePointer // 0x18
    private let sourceObject: OpaquePointer? // 0x20
    private let componentType: OpaquePointer? // 0x28
    private let matching: String? // 0x30
    private let lock = OSAllocatedUnfairLock<Void>(initialState: ()) // 0x40
    private var subscribers = OrderedCoatCheckBag<AnySubscriber<T, Never>>() // 0x48
    
    init(
        eventBus: REEventBus,
        coreHandle: OpaquePointer,
        sourceObject: OpaquePointer?,
        componentType: OpaquePointer?,
        matching: String?
    ) {
        self.eventBus = eventBus
        unsafe self.coreHandle = coreHandle
        unsafe self.sourceObject = sourceObject
        unsafe self.componentType = componentType
        self.matching = matching
    }
    
    func receive(_ input: Input) -> Subscribers.Demand {
        assertUnimplemented()
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        assertUnimplemented()
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Output == S.Input {
        assertUnimplemented()
    }
    
    func receive(subscription: any Subscription) {
        assertUnimplemented()
    }
}

extension REEventDispatcher {
    @safe fileprivate final class EventSubscription<U> {
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
