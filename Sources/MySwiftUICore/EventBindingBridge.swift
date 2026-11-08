@_spi(Internal) open class EventBindingBridge {
    public weak var eventBindingManager: EventBindingManager? = nil
//    private var trackedEvents: [EventID: EventBindingBridge.TrackedEventState] = [:]
    
    @MainActor
    @_alwaysEmitIntoClient
    public init() {}
    
    @MainActor
    @_alwaysEmitIntoClient
    public init(eventBindingManager: EventBindingManager) {
        self.eventBindingManager = eventBindingManager
    }

    deinit {
        assertUnimplemented()
    }

    open var eventSources: [any EventBindingSource] {
        assertUnimplemented()
    }

    open func send(_ events: [EventID : EventType], source: any EventBindingSource) -> Set<EventID> {
        assertUnimplemented()
    }

    open func reset(eventSource: any EventBindingSource, resetForwardedEventDispatchers: Bool) {
        assertUnimplemented()
    }

    fileprivate func resetEvents() {
        assertUnimplemented()
    }
}

extension EventBindingBridge : EventBindingManagerDelegate {
    @_spi(Internal) public func didBind(to event: EventBinding, id eventID: EventID) {
        assertUnimplemented()
    }

    @_spi(Internal) public func didUpdate(phase: GesturePhase<Void>, in manager: EventBindingManager) {
        assertUnimplemented()
    }

    @_spi(Internal) public func didUpdate(gestureCategory: GestureCategory, in manager: EventBindingManager) {
        assertUnimplemented()
    }
}
