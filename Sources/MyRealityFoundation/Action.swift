private import CoreRE

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol EntityAction {
    associatedtype EventParameterType = Never
    var isReversible: Bool { get }
    var isAdditive: Bool { get }
    var animatedValueType: (any AnimatableData.Type)? { get }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction {
    public var isReversible: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribe(from eventType: ActionEventType) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribeAll() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __register() {
        let typeName = _typeName(self, qualified: true)
        
        if let existing = unsafe AnimationResource.actionTypeMap[typeName] {
            if existing != self {
                preconditionFailure("Action type name \(typeName) already registered for type \(String(describing: existing))")
            }
            
            return
        }
        
        unsafe AnimationResource.actionTypeMap[typeName] = self
    }
    
    static func __subscribe(
        to event: ActionEventType,
        _ engine: __Engine?,
        _ block: (ActionEvent<Self>) -> Void
    ) {
        /*
         event -> x0 -> x22
         engine -> x1 -> x28
         block -> x2/x3 -> x20/x26
         */
        // x19
        weak var engine_2 = engine ?? __ServiceLocator.shared.engine
        
        // <+112>
        func dispatchEvent(sourceObject: UnsafeMutableRawPointer?, payloadRef: UnsafeRawPointer) -> CoreRE::EventHandlerResult {
            guard let engine_2 else {
                assertUnimplemented()
            }
            
            assertUnimplemented()
        }
        
        let typeName = _typeName(self, qualified: true)
        
        let eventID: UInt64
        if event == .started {
            eventID = getEventID(REAnimationTimelineEventStart.self)
        } else if event == .updated {
            eventID = getEventID(REAnimationTimelineEventUpdate.self)
        } else if event == .ended {
            eventID = getEventID(REAnimationTimelineEventEnd.self)
        } else if event == .skipped {
            eventID = getEventID(REAnimationTimelineEventSkipped.self)
        } else if event == .paused {
            eventID = getEventID(REAnimationTimelineEventPause.self)
        } else if event == .resumed {
            eventID = getEventID(REAnimationTimelineEventResume.self)
        } else if event == .terminated {
            eventID = getEventID(REAnimationTimelineEventTerminated.self)
        } else if event == .created {
            eventID = getEventID(REAnimationTimelineEventCreated.self)
        } else {
            return
        }
        
        // <+388>
        var subscriptions = unsafe AnimationResource.actionSubscriptions[ObjectIdentifier(self)] ?? [:]
        
        // <+516>
        if let handle = subscriptions[event] {
            // ConstantForceEffect인지 확실하지 않음
            unsafe unsafeBitCast(
                ConstantForceEffect.eventBus(engine),
                to: CoreRE::EventBus.self
            )
                .unsubscribe(handle)
        }
        
        // <+572>
        // x28
        let eventBus = unsafe unsafeBitCast(
            ConstantForceEffect.eventBus(engine),
            to: CoreRE::EventBus.self
        )
        
        let handle = unsafe eventBus
            .subscribe(
                eventID,
                nil,
                { sourceObject, payloadRef in
                    unsafe dispatchEvent(sourceObject: sourceObject, payloadRef: payloadRef)
                },
                typeName.utf8CString.withUnsafeBufferPointer { pointer in
                    return unsafe RETimelineEventFilter(pointer.baseAddress.unsafelyUnwrapped)
                }
            )
        
        // <+800>
        subscriptions[event] = handle
        unsafe AnimationResource.actionSubscriptions[ObjectIdentifier(self)] = subscriptions
    }
    
    @preconcurrency @MainActor static func __unsubscribe(
        from event: ActionEventType,
        _ engine: __Engine?
    ) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction where Self : Decodable, Self : Encodable, Self.EventParameterType : Decodable, Self.EventParameterType : Encodable {
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __registerCodable() {
        let typeName = _typeName(self, qualified: true)
        
        if let existing = unsafe AnimationResource.codableActionTypeMap[typeName] {
            if existing.parameter != self {
                preconditionFailure("Action type name \(typeName) already registered for type \(String(describing: existing))")
            }
            
            return
        }
        
        // <+200>
        unsafe AnimationResource.codableActionTypeMap[typeName] = (action: self, parameter: EventParameterType.self)
    }
}
