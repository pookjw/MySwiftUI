
@_spi(Internal)
open class EventBindingBridge {
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
}

extension EventBindingBridge : EventBindingManagerDelegate {
    package func didBind(to event: EventBinding, id eventID: EventID) {
        assertUnimplemented()
    }

    package func didUpdate(phase: GesturePhase<Void>, in manager: EventBindingManager) {
        assertUnimplemented()
    }

    package func didUpdate(gestureCategory: GestureCategory, in manager: EventBindingManager) {
        assertUnimplemented()
    }
}
