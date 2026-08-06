// 9E3AD6BA34D478C65D106D94F4542597
private import os.lock
internal import Combine
private import CoreRE

@safe final class REEventDispatcher<T> : Combine::Subscriber, Combine::Publisher, Combine::CustomCombineIdentifierConvertible {
    typealias Input = T
    typealias Failure = Never
    typealias Output = T
    
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
        /*
         subscriber -> x0 -> x24
         S -> x1 -> x25
         self -> x20 -> x29 - 0xd8
         */
        // <+568>
        let anySubscriber = Combine::AnySubscriber<T, Never>(subscriber)
        
        // <+1844>
        let lock = self.lock
        lock.lock()
        let ticket = self.subscribers.append(anySubscriber)
        lock.unlock()
        
        // <+1940>
        let eventSubscription = unsafe REEventDispatcher.EventSubscription(
            eventBus: self.eventBus,
            coreHandle: self.coreHandle,
            sourceObject: self.sourceObject,
            componentType: self.componentType,
            matching: self.matching,
            downstream: subscriber
        ) { [weak self] in
            // $s17RealityFoundation17REEventDispatcherC7receive10subscriberyqd___t5InputQyd__Rsz7Combine10SubscriberRd__s5NeverO7FailureRtd__lFyycfU_TA
            guard let self else {
                return
            }
            
            let lock = self.lock
            lock.lock()
            self.subscribers.remove(ticket)
            lock.unlock()
        }
        
        subscriber.receive(subscription: eventSubscription)
    }
    
    func receive(subscription: any Subscription) {
        assertUnimplemented()
    }
}

extension REEventDispatcher {
    @safe fileprivate final class EventSubscription<U> : Combine::CustomCombineIdentifierConvertible, Combine::Cancellable, Combine::Subscription {
        private weak var eventBus: REEventBus? = nil // 0x10
        private var coreHandle: OpaquePointer // 0x18
        private var coreSubscription: CoreRE::SubscriptionHandle? = nil // 0x20
        private var downstream: U? = nil // 0x80 (field)
        private var cancellationHandler: (() -> (Void))? = nil // 0x88 (field)
        private var pendingDemand: Subscribers.Demand = .max(0) // 0x90 (field)
        
        // $s17RealityFoundation17REEventDispatcherC17EventSubscription33_9E3AD6BA34D478C65D106D94F4542597LLC8eventBus10coreHandle12sourceObject13componentType8matching10downstream19cancellationHandlerAFyx_qd__GAA0cP0C_s13OpaquePointerVARSgASSSSgqd__yyctcfc
        init(
            eventBus: REEventBus,
            coreHandle: OpaquePointer,
            sourceObject: OpaquePointer?,
            componentType: OpaquePointer?,
            matching: String?,
            downstream: U,
            cancellationHandler: @escaping () -> Void
        ) {
            /*
             eventBus -> x0 -> x24
             coreHandle -> x1 -> x29 - 0xd0
             sourceObject -> x2 -> x29 - 0xa8
             componentType -> x3 -> x29 - 0xe0
             matching -> x4/x5 -> x29 - 0xd8 / x29 - 0xc0
             downstream -> x6 -> x26
             cancellationHandler -> x29 - 0x88 / x29 - 0x90
             Self -> x29 - 0xb8
             */
            // <+216>
            self.eventBus = eventBus
            unsafe self.coreHandle = coreHandle
            self.downstream = downstream
            
            let coreSubscription: CoreRE::SubscriptionHandle
            if let matching {
                // <+348>
                let eventID = getEventID(T.self)
                
                coreSubscription = unsafe unsafeBitCast(coreHandle, to: CoreRE::EventBus.self)
                    .subscribeWithMatch(
                        eventID,
                        unsafeBitCast(sourceObject, to: UnsafeMutableRawPointer?.self),
                        { [self] _, _ in
                            // $s17RealityFoundation17REEventDispatcherC17EventSubscription33_9E3AD6BA34D478C65D106D94F4542597LLC8eventBus10coreHandle12sourceObject13componentType8matching10downstream19cancellationHandlerAFyx_qd__GAA0cP0C_s13OpaquePointerVARSgASSSSgqd__yyctcfcSo0cZ6ResultVSvSg_SVtcANcfu_AvW_SVtcfu0_TA
                            assertUnimplemented()
                        },
                        matching.utf8CString.withUnsafeBufferPointer { pointer in
                            return unsafe RETimelineEventFilter(pointer.baseAddress.unsafelyUnwrapped)
                        }
                    )
                
                // <+648>
            } else {
                // <+520>
                let eventID = getEventID(T.self)
                
                coreSubscription = unsafe unsafeBitCast(coreHandle, to: CoreRE::EventBus.self)
                    .subscribeWithMatch(
                        eventID,
                        unsafeBitCast(sourceObject, to: UnsafeMutableRawPointer?.self),
                        { [self] _, _ in
                            // $s17RealityFoundation17REEventDispatcherC17EventSubscription33_9E3AD6BA34D478C65D106D94F4542597LLC8eventBus10coreHandle12sourceObject13componentType8matching10downstream19cancellationHandlerAFyx_qd__GAA0cP0C_s13OpaquePointerVARSgASSSSgqd__yyctcfcSo0cZ6ResultVSvSg_SVtcANcfu1_AvW_SVtcfu2_TA
                            assertUnimplemented()
                        },
                        unsafeBitCast(componentType, to: UnsafeRawPointer.self)
                    )
                
                // <+648>
            }
            
            // <+648>
            self.coreSubscription = coreSubscription
            self.cancellationHandler = cancellationHandler
        }
        
        func request(_ demand: Combine::Subscribers.Demand) {
            self.pendingDemand = self.pendingDemand + demand
        }
        
        func cancel() {
            assertUnimplemented()
        }
    }
}
