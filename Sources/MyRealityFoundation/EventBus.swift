// C907048D367572FD9E6EC4CB4F65EE59
private import CoreRE

@safe final class REEventBus {
    private let coreHandle: OpaquePointer
    private var dispatchersByHandle: [REEventBus.DispatcherHandle : Any]
    
    @inline(__always) // 원래 없음
    init(coreHandle: OpaquePointer) {
        unsafe self.coreHandle = coreHandle
        self.dispatchersByHandle = [:]
        
        unsafe __RERetain(coreHandle)
        unsafe unsafeBitCast(coreHandle, to: CoreRE::EventBus.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
    }
    
    deinit {
        assertUnimplemented()
    }
}

extension REEventBus {
    @safe fileprivate struct DispatcherHandle : Hashable {
        private let eventID: UInt64
        private let sourceObject: OpaquePointer?
        private let componentType: OpaquePointer?
        private let matching: String?
        
        init<T>(event: T.Type, sourceObject: EventSource?, componentType: (any MyRealityFoundation::Component.Type)?, matching: String?) {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: REEventBus.DispatcherHandle, rhs: REEventBus.DispatcherHandle) -> Bool {
            assertUnimplemented()
        }
    }
}

func getEventID<T>(_ type: T.Type) -> UInt64 {
    if let existing = unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)] {
        return existing
    }
    
    // <+136>
    var _type: Any.Type
    if type is AccessibilityActivateEvent.Type {
        _type = AccessibilityActivateEvent.self
    } else if type is AccessibilityIncrementEvent.Type {
        _type = AccessibilityIncrementEvent.self
    } else if type is AccessibilityDecrementEvent.Type {
        _type = AccessibilityDecrementEvent.self
    } else if type is AccessibilityCustomActionEvent.Type {
        _type = AccessibilityCustomActionEvent.self
    } else if type is AccessibilityCustomActionEvent.Type {
        _type = AccessibilityCustomActionEvent.self
    } else if type is AccessibilityRotorNavigationEvent.Type {
        _type = AccessibilityRotorNavigationEvent.self
    } else {
        _type = T.self
    }
    
    // <+232>
    if type is ImagePresentationComponent.Spatial3DImage.GenerationStartedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationStartedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationFailedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationFailedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationCancelledEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationCancelledEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationCompletedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationCompletedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationProgressUpdatedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationProgressUpdatedEvent.self
    }
    
    // <+356>
    if let existing = unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(_type)] {
        return existing
    }
    
    let eventID = String(describing: T.self)
        .utf8CString
        .withUnsafeBufferPointer { pointer in
            return CoreRE::EventBus.makeID(pointer.baseAddress.unsafelyUnwrapped)
        }
    
    unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)] = eventID
    return unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)]!
}

fileprivate enum RegisteredEventsToEventBusIds {
    static nonisolated(unsafe) var registeredEventsToEventBusIds: [ObjectIdentifier : UInt64] = RegisteredEventsToEventBusIds.generateRegisteredEventsToEventBusIds()
    
    static func generateRegisteredEventsToEventBusIds() -> [ObjectIdentifier : UInt64] {
        assertUnimplemented()
    }
}
